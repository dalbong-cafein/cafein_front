import 'dart:convert';

import 'package:cafein_front/Login/SuccessScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
bool phonenumber_correct = false;
var phone_num;
bool number_input = false;
var message_num;
bool message_num_correct = false;
var input_num;
var _controller = TextEditingController();
class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;

    print(MediaQuery.of(context).viewInsets.bottom.toString());
    return !number_input ?Scaffold(
      resizeToAvoidBottomInset : false,
      body: Column(
        children : [
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top : height * 0.1, left: width * 0.05),
              child: Text("본인확인을 위해\n휴대폰 번호 인증을 해주세요" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            )

          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: height * 0.05),
                width: width * 0.9,
                height: height * 0.1,
                child: TextFormField(
                  onChanged: (text){
                    print(text);
                    phone_num = text;
                    print("pn" + phone_num);
                    setState(() {
                      if(text.length == 11){
                        phonenumber_correct = true;

                      }else{
                        phonenumber_correct = false;
                      }
                    });

                  },
                  cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                  decoration: InputDecoration(
                    hintText: "휴대폰 번호를 입력해주세요",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(252, 99, 6, 1.0) , width: 1)
                    )
                  ),
                ),

              )
            ],
          )

        ]

      ),
      bottomSheet: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom ),

          child: Container(
            width: width,
            height: height * 0.07,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: phonenumber_correct? Color.fromRGBO(252, 99, 6, 1.0) : const Color(0xffD1D1D1)
              ),
              onPressed: () async {
                if(phonenumber_correct){
                  //TODO textfield에서 입력받은 번호를 substring 하여 휴대폰 인증 서버로 전송
                  String pn = phone_num.substring(0 , 3) +"-"+ phone_num.substring(3, 7)+"-" + phone_num.substring(7,11);

                  var url_phone = Uri.parse("https://api.cafeinofficial.com/auth/send-sms?toNumber=" + pn);

                  var response = await http.get(url_phone);

                  print('Response header - message: ${response.headers}');
                  print('Response body - message: ${response.body}');

                  //TODO 서버에서 response body로 인증번호 받아서 사용자가 입력한것과 맞는지 확인
                  Map<String , dynamic> message = jsonDecode(response.body);
                  message_num = message['data']; //TODO message_num에 인증번호를 담아두고 사용자가 올바르게 입력하는지 확인한다.
                  setState(() {
                    number_input = true; //TODO 휴대폰 번호 입력이 완료되었으면 인증번호 입력 창으로 이동한다.
                    //TODO 화면이 바뀌어야 하므로 setState 안에 넣어 다시 빌드해준다.
                  });

                }
                },
              child: Text("인증번호 받기"),
            ),
          ),
        ),

      ),

    ) : _numberInput(height, width);


  }
  Widget _numberInput(double height, double width){ //TODO 휴대폰 인증번호 입력
    _controller.clear(); //TODO 입력 칸에 휴대폰 번호가 남아있는 것을 방지한다.
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Column(
          children : [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top : height * 0.1, left: width * 0.05),
                  child: Text("인증번호 4자리를\n입력해주세요" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                )

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: height * 0.05),
                  width: width * 0.9,
                  height: height * 0.1,
                  child: TextFormField(
                    controller: _controller,
                    onChanged: (text_message){
                      if(text_message.length == 4){
                        message_num_correct = true;
                        input_num = text_message;
                      }else{
                        message_num_correct = false;
                      }


                    },
                    cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                    decoration: InputDecoration(
                        hintText: "인증번호 6자리",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(252, 99, 6, 1.0) , width: 1)
                        )
                    ),
                  ),

                )
              ],
            )

          ]

      ),
      bottomSheet: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom ),

          child: Container(
            width: width,
            height: height * 0.07,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: message_num_correct? Color.fromRGBO(252, 99, 6, 1.0) : const Color(0xffD1D1D1)
              ),
              onPressed: () async {
                if(message_num_correct){
                  if(input_num == message_num.toString()){ //TODO 인증번호가 맞으면
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessScreen()),
                    );
                  }else{
                    print("틀림");
                  }
                }
              },
              child: Text("확인"),
            ),
          ),
        ),

      ),

    );
  }



}
