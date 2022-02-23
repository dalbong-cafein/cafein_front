
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'dart:io' show Platform;

import 'package:kakao_flutter_sdk/all.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Future<void> _loginButtonPressed() async{
    String authCode = await AuthCodeClient.instance.request();
    print(authCode);
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    String initialLink = ""; //redirect url

    //안드로이드 , ios 여부
    try{
      if (Platform.isAndroid) {
        print("android");
      } else if (Platform.isIOS) {
        print("ios");
      }
    }catch(e){
      print(e);
    }

    return Scaffold(

      body:Stack(

        children: [

          Center(
            child: SizedBox(child: Image.asset("imgs/loginscreen_background.png", fit: BoxFit.contain),

            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Container(

                width: width * 0.9,
                height: height * 0.05,
                margin: EdgeInsets.only(top: height * 0.78, left: width * 0.05),
                child: RaisedButton(
                  onPressed: () async {
                    _loginButtonPressed();
                    /*
                    카카오톡으로 로그인 버튼 눌렀을 때
                     */

                  },

                  color: Color.fromRGBO(247, 230, 0, 1.0),
                  textColor: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("카카오톡으로 시작하기")],
                  ),
                )
              ),
              Container(
                  width: width * 0.9,
                  height: height * 0.05,
                  margin: EdgeInsets.only(top: height * 0.01, left: width * 0.05),
                  child: RaisedButton(
                    onPressed: () async {
                      /*
                    네이버로 로그인 버튼 눌렀을 때
                     */


                    },

                    color: Color.fromRGBO(4, 207,92, 1.0),
                    textColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("네이버로 시작하기")],

                    ),
                  )
              ),

            ],
          ),

        ],

      )

    );
  }
}

