import 'package:cafein_front/CafePlus/CafeMapScreen.dart';
import 'package:cafein_front/CafePlus/CafeReviseScreen.dart';
import 'package:cafein_front/CafePlus/CafeplusScreen.dart';
import 'package:cafein_front/Login/PhoneScreen.dart';
import 'package:cafein_front/Login/SplashScreen.dart';
import 'package:cafein_front/Main/MainScreen.dart';
import 'package:cafein_front/Main/MyCafeScreen.dart';
import 'package:cafein_front/Map/CafeScreen_UT.dart';
import 'package:cafein_front/Map/MapScreen.dart';
import 'package:cafein_front/Map/SearchScreen.dart';
import 'package:cafein_front/Review/ReviewScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';

import '../CafePlus/CafeSearchScreen.dart';
import '../Login/LoginScreen.dart';
import '../Login/RegisterScreen.dart';
import '../Map/CafeScreen.dart';
import '../Review/ReviewScreen2.dart';

class TestScreen extends StatefulWidget {
  final String token;
  const TestScreen(this.token);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top : height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top : height * 0.01),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }, icon:Text("로그인화면"),),
                ),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneScreen(widget.token)),
                    );
                  }, icon:Text("핸드폰 인증 화면"),color: Colors.orange,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  }, icon:Text("스플래쉬 화면"),color: Colors.orange,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen(widget.token)),
                    );
                  }, icon:Text("메인화면"),color: Colors.orange,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReviewScreen2(widget.token, 1)),
                    );
                  }, icon:Text("리뷰 등록 화면"),color: Colors.orange,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen(widget.token)),
                    );
                  }, icon:Text("닉네임 설정 화면"),color: Colors.orange,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CafeReviseScreen()),
                    );
                  }, icon:Text("카페 정보 수정 화면"),color: Colors.orange,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CafeplusScreen("주소","카페이름","","","","",'',0, 0, widget.token)),
                    );
                  }, icon:Text("카페 등록 화면"),color: Colors.orange,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen(widget.token)),
                    );
                  }, icon:Text("검색 화면"),color: Colors.orange,),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top : height * 0.01),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CafeSearchScreen(widget.token)),
                    );
                  }, icon:Text("주소 찾기 화면"),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top : height * 0.01),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CafeScreen(widget.token, 1)),
                    );
                  }, icon:Text("카페상세화면"),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top : height * 0.01),
                child: Container(
                  color: Colors.orange,
                  height: height * 0.05,
                  width: width * 0.8,
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>MyCafeScreen(widget.token)),
                    );
                  }, icon:Text("나의 카페 화면"),),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
