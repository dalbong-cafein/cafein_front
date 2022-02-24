
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'dart:io' show Cookie, HttpHeaders, Platform;
import 'package:cookie_jar/cookie_jar.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Map<String, String> headers = {};


class _LoginScreenState extends State<LoginScreen> {
  String os = " ";
  Future<void> _loginButtonPressed() async{
    String authCode = await AuthCodeClient.instance.request();
    print("사용자 코드는 : " + authCode);
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;


    //안드로이드 , ios 여부
    try{
      if (Platform.isAndroid) {
        os = "android";
        print(os);

      } else if (Platform.isIOS) {
        os = "ios";
        print(os);

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
                      // var s = Session();
                      // s.get("http://122.32.154.106/oauth2/authorization/naver");
                      var url = Uri.parse('http://10.0.2.2:5000/auth/test');

                      var response = await http.get(url, headers: {'test': '123', 'cookie' : 'os=${os}'});

                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');


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

