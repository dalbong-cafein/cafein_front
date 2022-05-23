import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:cafein_front/CDS/CafeinColors.dart';
import 'package:cafein_front/Login/SuccessScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;


import '../Main/MainScreen.dart';
import 'RegisterScreen.dart';


bool phonenumber_correct = false;
var phone_num;
bool number_input = false;
var message_num;
bool message_num_correct = false;
var input_num;
bool nextscreen= true;
var _controller = TextEditingController();
class PhoneScreen extends StatefulWidget {
  final String token;
  const PhoneScreen(this.token);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final FocusNode _focusNode = FocusNode();
  bool textin = false;
  bool enable= false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;

    print(MediaQuery.of(context).viewInsets.bottom.toString());
    return !number_input ?Scaffold(

      resizeToAvoidBottomInset : false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children : [
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top : h_percent *116, left: 20 * w_percent),
              child: Text("본인확인을 위해\n휴대폰 번호 인증을 해주세요" , style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800),),
            )

          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top :10 * h_percent, left: 20 * w_percent),
                child: Text("휴대폰 번호는 카페인 서비스 이용을 위해 저장되며\n서비스 이용 기간 동안 안전하게 보관됩니다." , style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600,)),
              )

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top : 24 * h_percent),
                child: Container(


                  height: 56 * height / height_whole,
                  width: width - 40 *w_percent,
                  child: RawKeyboardListener(
                    focusNode: _focusNode,
                    onKey: (event){
                      if(event.logicalKey == LogicalKeyboardKey.backspace && enable == true){
                        enable = false;
                        setState(() {

                        });
                      }

                    },
                    child: TextField(
                      focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],

                      readOnly: enable,
                      showCursor: true,
                      cursorColor: Color.fromRGBO(252, 99, 6, 1.0),
                      autofocus: true,
                      controller: _controller,
                      onChanged: (text){
                        textin = true;
                        enable = false;
                        print(text);
                        phone_num = text;
                        print("pn" + phone_num);
                        setState(() {
                          if(text.length == 11){
                            phonenumber_correct = true;
                            enable= true;
                          }if(text.length == 0){
                            textin = false;
                          }else{
                            phonenumber_correct = false;
                          }
                        });

                      },


                      decoration: InputDecoration(

                        suffixIcon: textin ? IconButton(icon : Icon(Icons.cancel, color : Color(0xffD1D1D1)), onPressed:(){
                          _controller.clear();
                          enable = false;
                          setState(() {

                          });

                        },) : Container(width: width * 0.0000001,), //Align(child: Icon(Icons.cancel), widthFactor: 5,),
                        hintText:"휴대폰 번호를 입력해 주세요" ,
                        hintStyle: TextStyle(fontFamily: 'MainFont', fontSize: 16, fontWeight: FontWeight.w600, color : Color(0xffACACAC)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1, color: Color(0xffFC7521))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1, color: Color(0xffACACAC))
                        ),


                      ),
                    ),
                  ),

                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top : 28 * h_percent),
            child: Container(
              height: 14 * h_percent,
              width: 78 * w_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen(widget.token)),
                  );

                },
                icon: Image.asset("imgs/laterimage.png",),
              ),
            ),
          ),

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

                  _sendMessage();

                }
                },
              child: Text("인증번호 받기"),
            ),
          ),
        ),

      ),

    ) : _numberInput(height, width);


  }

  Future<void> _sendMessage() async {
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


  Widget _numberInput(double height, double width){ //TODO 휴대폰 인증번호 입력
    if(nextscreen){ //TODO 다음 화면으로 넘어갈떈 휴대폰 번호 입력했던 것을 삭제해야한다.
      _controller.clear();
      nextscreen = false;
    }  //TODO 입력 칸에 휴대폰 번호가 남아있는 것을 방지한다.
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
                        setState(() {
                          message_num_correct = true;
                        });

                        input_num = text_message;
                      }else{
                        setState(() {
                          message_num_correct = false;
                        });

                      }
                    },
                    cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                    decoration: InputDecoration(
                        hintText: "인증번호 4자리",
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
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessScreen(widget.token)),
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
