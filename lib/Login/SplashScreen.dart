import 'dart:async';

import 'package:cafein_front/Login/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    Timer(Duration(seconds: 2), () { //2초후 화면 전환
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });

    return Scaffold(
        body :Stack(
          children: [

            Center(
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Image.asset("imgs/splashimg.png", fit: BoxFit.fill),

                )
            )

          ],
        )

    );
  }
}
