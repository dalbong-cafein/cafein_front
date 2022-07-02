import 'dart:async';

import 'package:cafein_front/Login/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var rnd = Random().nextInt(2);
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;

    Timer(Duration(seconds: 2), () { //2초후 화면 전환
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });

    return Scaffold(
        body :Stack(
          children: [

            Center(
                child: Container(
                  width: w_percent * width_whole,
                  height: height,
                  child: rnd == 0? Image.asset("imgs/splashimg1.png",  fit: BoxFit.fill):Image.asset("imgs/splashimg2.png", fit: BoxFit.fill),

                )
            ),

            Padding(
              padding:EdgeInsets.only(top : 100 *h_percent, left : 28 *w_percent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("콘센트 자리가 없을 때", style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500, fontFamily: 'TitleFont_Kor', color : CafeinColors.grey800) ),
                  Text("카페 자리가 없을 때", style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500, fontFamily: 'TitleFont_Kor', color : CafeinColors.grey800)),
                  Padding(
                    padding: EdgeInsets.only(top : 22 * h_percent),
                    child: Text("카공인을 위한 지도", style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500, fontFamily: 'TitleFont_Kor', color : CafeinColors.grey800)),
                  )

                ],
              ),
            )

          ],
        )

    );
  }
}
