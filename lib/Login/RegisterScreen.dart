
import 'dart:math';

import 'package:cafein_front/Login/LoginScreen.dart';
import 'package:cafein_front/Login/PhoneScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


String profileimg = " ";
final myController = TextEditingController();
String nickname = myController.text; //입력받은 닉네임
bool nickname_correct = false;
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}




class _RegisterScreenState extends State<RegisterScreen> {



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final randomint = Random().nextInt(3);
    if(randomint == 0){
      profileimg = "imgs/randomimg1.png";
    }
    if(randomint == 1){
      profileimg = "imgs/randomimg2.png";
    }
    else{
      profileimg = "imgs/randomimg3.png";
    }

    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("닉네임 설정"),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            /*
            취소버튼 클릭
             */
          }, icon: Icon(Icons.cancel_outlined), color: Colors.black,iconSize: 30,),

        ],

      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.3,
            width: height * 0.3,
            child: IconButton(onPressed: (){
              /*
              사진 클릭시
               */
            }, icon: Image.asset(profileimg, fit: BoxFit.fill,)),
          ),
          Container(
            height: height * 0.07,
            width: width * 0.8,
            child: TextFormField(

              onChanged: (text){
                setState(() {
                  if(text.length >= 10 || text.contains('!')|| text.contains('@')|| text.contains('#')|| text.contains('~')|| text.contains('`')|| text.contains('%')|| text.contains('^')|| text.contains('&')|| text.contains('*')|| text.contains('(')|| text.contains(')')|| text.contains('-')|| text.contains('_')|| text.contains('=')|| text.contains('+')|| text.contains('[')|| text.contains(']')|| text.contains('{')|| text.contains('}')|| text.contains('|')|| text.contains(';')|| text.contains(':')|| text.contains('/')|| text.contains('?')|| text.contains('>')|| text.contains('.')|| text.contains('<')|| text.contains(',')|| text.contains('"')|| text.contains("'")){
                    nickname_correct = false;
                  }
                  else{
                    nickname_correct = true;
                  }
                });
              },

              cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

              controller: myController,
              decoration: InputDecoration(

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(width: 1, color: Color.fromRGBO(252, 99, 6, 1.0))
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(width: 1, color: Color.fromRGBO(252, 99, 6, 1.0))
                ),
                labelText: nickname_correct ? "멋진 닉네임이에요!" : "10자 이하, 영문/숫자/한글만 사용 가능해요",
                labelStyle: TextStyle(color : nickname_correct ? Colors.blue : Color.fromRGBO(252, 99, 6, 1.0))
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top: height * 0.4),
                width: width,
                height: height * 0.08,
                child: RaisedButton(onPressed: () {
                  if(nickname_correct){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneScreen()),
                    );
                  }
                },
                  child: Text("확인"),
                  textColor: Colors.white,
                  color:nickname_correct ?  Color.fromRGBO(252, 99, 6, 1.0) : const Color(0xffD1D1D1),

                )
              ),
            ],
          )



        ],
      ),

    );
  }
}
