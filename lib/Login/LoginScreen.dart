
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
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








  void _sendos() async {
    var url = Uri.parse('http://cafein-env.eba-ipjcypwd.ap-northeast-2.elasticbeanstalk.com/oauth2/authorization/kakao');

    var response = await http.get(url, headers: {'cookie' : 'os=${os}'});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
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
        initUni();

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
                    _launchURL();
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
                      var url = Uri.parse('https://flutterbooksample.com');

                      var response = await http.get(url);

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

_launchURL() async {
  const url = 'http://cafein-env.eba-ipjcypwd.ap-northeast-2.elasticbeanstalk.com/oauth2/authorization/kakao';
  if (await canLaunch(url)) {
    await launch(url);

  } else {
    throw 'Could not launch $url';
  }}
