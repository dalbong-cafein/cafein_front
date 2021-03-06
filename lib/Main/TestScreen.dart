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
import 'package:cafein_front/Report/ReportScreen.dart';
import 'package:cafein_front/Review/AllReviewScreen.dart';
import 'package:cafein_front/Review/ReviewScreen.dart';
import 'package:cafein_front/Sticker/CuponScreen.dart';
import 'package:cafein_front/Sticker/StickerScreen.dart';
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
                  }, icon:Text("????????? ?????? ??????"),color: Colors.orange,),
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
                      MaterialPageRoute(builder: (context) => MainScreen(widget.token, 1, "")),
                    );
                  }, icon:Text(">>>>>>>>>>>????????????<<<<<<<<<<<<<"),color: Colors.orange,),
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
                  }, icon:Text("????????? ?????? ??????"),color: Colors.orange,),
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
                  }, icon:Text("?????? ?????? ?????? ??????"),color: Colors.orange,),
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
                      MaterialPageRoute(builder: (context) => CafeplusScreen("??????","????????????","","","","",'',0, 0, widget.token)),
                    );
                  }, icon:Text("?????? ?????? ??????"),color: Colors.orange,),
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
                  }, icon:Text("?????? ?????? ??????"),),
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
                  }, icon:Text("?????? ?????? ??????"),),
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
                      MaterialPageRoute(builder: (context) =>CuponScreen(widget.token)),
                    );
                  }, icon:Text("?????? ??????"),),
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
                      MaterialPageRoute(builder: (context) =>StickerScreen(widget.token)),
                    );
                  }, icon:Text("????????? ??????"),),
                ),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
