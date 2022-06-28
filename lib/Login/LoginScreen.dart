
import 'package:cafein_front/Login/PhoneScreen.dart';
import 'package:cafein_front/Login/RegisterScreen.dart';
import 'package:cafein_front/Main/MainScreen.dart';
import 'package:cafein_front/Main/TestScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  Future<void> _kakaologinButtonPressed() async {
    OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
    print('로그인 성공 ${token.accessToken}');
    var url_login = Uri.parse("https://api.cafeinofficial.com/auth/social-login"); //백서버의 로그인 api와 연결
    //백에 accessToken을 전달
    var response = await http.post(url_login, headers: <String, String>{'authProvider' : 'KAKAO', 'oAuthAccessToken' : token.accessToken});
    //header cookie 받기(각종 사용자 정보 , refreshToken 등)
    print('Response header - login: ${response.headers}');
    print('Response body- login: ${response.body}');
    //header에서 access token 저장하기
    var token1 = response.headers.values.elementAt(1).toString();
    print("파싱전 token ----" + token1 + "-------");
    token_string = token1.substring(12, token1.length);
    var token_string_splited = token_string.split("; Max-Age");
    token_string = token_string_splited[0];
    var token2 = response.headers.values.elementAt(1).toString().split("refreshToken=");

    token2 = token_strin_refresh.split("; Max-Age");
    token_strin_refresh = token2[0];
    //refresh token 저장, //access token 저장
    print("refresh token ======" + token_strin_refresh + "===========");
    print("token -----" + token_string + "--------");
    User user = await UserApi.instance.me();
    print('사용자 정보 요청 성공' //TODO 서버 연결 없이 사용자 정보를 얻고싶을 때
        '\n회원번호: ${user.id}'
        '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
        '\n이메일: ${user.kakaoAccount?.email}');

    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TestScreen(token_string)
        ));

  }
  Future<void> _naverloginButtonPressed() async{
    print('hello');
    NaverLoginResult res = await FlutterNaverLogin.logIn();
    final NaverLoginResult result = await FlutterNaverLogin.logIn();
    NaverAccessToken res2 = await FlutterNaverLogin.currentAccessToken;
    setState(() {
      var accesToken = res2.accessToken;
      var tokenType = res2.tokenType;
      print(accesToken);
    });
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
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;

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

      body:Container(
        width: w_percent * width_whole,
        height: height,
        child: Stack(
          children: [
            Container(
                width: w_percent * width_whole,
                height: height,
                child: Image.asset("imgs/loginimage_new.png", fit: BoxFit.fill,)),
            Opacity(
              opacity: 0.5,
              child: Container(
                width: w_percent * width_whole,
                height: height,
                color : Colors.black
              ),
            ),
            Column(

              children: [
                Container(
                  height: 0.5 * height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top : 130 * h_percent),
                        child: Container(
                          width: 140 * w_percent,
                          height: 37 * h_percent,
                          child: Image.asset("imgs/logincafeinlogoimage.png", fit : BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 82 * h_percent),
                            child: Container(
                              width : w_percent * 320,
                              height: 56 * h_percent,
                              child: IconButton(
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(), // constraints
                                onPressed: () {
                                  _kakaologinButtonPressed();
                                },
                                icon: Container(
                                  width : w_percent * 320,
                                  height: 56 * h_percent,
                                  decoration: BoxDecoration(
                                   color : Color(0xffFEE500),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(14.0)
                                    ),
                                  ),

                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: w_percent * 24,
                                            height: h_percent * 24,
                                            child: Image.asset("imgs/kakologoimage.png")),
                                        Padding(
                                          padding: EdgeInsets.only(left : 6 *w_percent),
                                          child: Text("카카오로 3초만에 시작하기", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color :Color(0xff3E2723)) ),
                                        )
                                      ],

                                    ),
                                  ),
                                ),
                              ),

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
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
