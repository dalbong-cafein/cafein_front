
import 'package:cafein_front/Login/PhoneScreen.dart';
import 'package:cafein_front/Login/RegisterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:io' show Cookie, HttpHeaders, Platform;

import 'package:kakao_flutter_sdk/all.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_naver_login/flutter_naver_login.dart';

String token_string = "";
String token_strin_refresh = "";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Map<String, String> headers = {};


class _LoginScreenState extends State<LoginScreen> {
  String os = " ";
  Future<void> _loginButtonPressed() async {
    OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
    print('로그인 성공 ${token.accessToken}');
    var url_login = Uri.parse("https://api.cafeinofficial.com/auth/social-login"); //TODO 백서버의 로그인 api와 연결
    //TODO 백에 accessToken을 전달

    var response = await http.post(url_login, headers: <String, String>{'authProvider' : 'KAKAO', 'oAuthAccessToken' : token.accessToken});

    //TODO header cookie 받기(각종 사용자 정보 , refreshToken 등)
    print('Response header - login: ${response.headers}');
    print('Response body- login: ${response.body}');

    //TODO header에서 access token 저장하기


    var token1 = response.headers.values.elementAt(1).toString();
    print("파싱전 token ----" + token1 + "-------");
    token_string = token1.substring(12, token1.length);
    var token_string_splited = token_string.split("; Max-Age");
    token_string = token_string_splited[0];
    var token2 = response.headers.values.elementAt(1).toString().split("refreshToken=");
    token_strin_refresh = token2[1];
    token2 = token_strin_refresh.split("; Max-Age");
    token_strin_refresh = token2[0];

    //TODO refresh token 저장, //TODO access token 저장

    print("refresh token ======" + token_strin_refresh + "===========");
    print("token -----" + token_string + "--------");
    User user = await UserApi.instance.me();
    print('사용자 정보 요청 성공' //TODO 서버 연결 없이 사용자 정보를 얻고싶을 때
        '\n회원번호: ${user.id}'
        '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
        '\n이메일: ${user.kakaoAccount?.email}');
    if(token.accessToken != null){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen(token_string)
      ));

    }
  }




  void _sendos() async {
    // var url = Uri.parse('http://cafein-env.eba-ipjcypwd.ap-northeast-2.elasticbeanstalk.com/oauth2/authorization/kakao');
    //
    // var response = await http.get(url, headers: {'cookie' : 'os=${os}'});
    //
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;

    Future<Null> initUni()async{
      try{
        Uri? initialLink = await getInitialUri();
        print(initialLink);
      }on PlatformException{
        print("k");
      }
    }
    //안드로이드 , ios 여부
    try{
      if (Platform.isAndroid) {
        os = "android";

        _sendos();


      } else if (Platform.isIOS) {
        os = "ios";
        _sendos();

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
                      print('hello');
                      NaverLoginResult res = await FlutterNaverLogin.logIn();
                      final NaverLoginResult result = await FlutterNaverLogin.logIn();
                      NaverAccessToken res2 = await FlutterNaverLogin.currentAccessToken;
                      setState(() {
                        var accesToken = res2.accessToken;
                        var tokenType = res2.tokenType;
                        print(accesToken);
                      });



                    },

                    color: Color.fromRGBO(4, 207,92, 1.0),
                    textColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("네이버로 시작하기(미구현)")],

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

_launchURL() async {
  const url = 'http://cafein-env.eba-ipjcypwd.ap-northeast-2.elasticbeanstalk.com/oauth2/authorization/kakao';
  if (await canLaunch(url)) {
    await launch(url);

  } else {
    throw 'Could not launch $url';
  }}
