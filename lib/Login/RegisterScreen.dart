import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
String profileimg = " ";
final myController = TextEditingController();
String nickname = myController.text; //입력받은 닉네임

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({Key? key}) : super(key: key);


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
            height: height * 0.4,
            width: height * 0.4,
            child: IconButton(onPressed: (){
              /*
              사진 클릭시
               */
            }, icon: Image.asset(profileimg, fit: BoxFit.fill,)),
          ),
          Container(
            height: height * 0.2,
            margin: EdgeInsets.only(top: height * 0.03, left: width * 0.1, right: width * 0.1, bottom: height * 0.1),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "닉네임",
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top: height * 0.05),
                width: width,
                height: height * 0.08,
                child: RaisedButton(onPressed: () {
                  /*
                  확인버튼 눌렸을떄
                   */
                },
                  child: Text("확인"),
                  textColor: Colors.white,
                  color: Color.fromRGBO(252, 99, 6, 1.0),

                )
              ),
            ],
          )



        ],
      ),

    );
  }
}
