import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';


class LoginScreen extends StatelessWidget {


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
                      //
                      // var dio = Dio();
                      // var response = await dio.get(url_naver_redirect);
                      //
                      // print(response);
                      // var dio2 =  Dio();
                      // var cookieJar= CookieJar();
                      // dio2.interceptors.add(CookieManager(cookieJar));
                      // // Print cookies
                      // print(cookieJar.loadForRequest(Uri.parse(url_naver_cookie)));
                      Future<void> initUniLinks() async{
                        try{
                          initialLink = (await getInitialLink())!;
                          print(initialLink);
                        }on PlatformException{
                        }
                      }
                      initUniLinks();

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

