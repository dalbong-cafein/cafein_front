import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
bool phonenumber_correct = false;
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
    return Scaffold(
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
              onPressed: () {
                if(phonenumber_correct){
                 /*
                인증번호 완료 누르면
                  */
                }
                },
              child: Text("인증번호 받기"),
            ),
          ),
        ),

      ),

    );
  }
}
