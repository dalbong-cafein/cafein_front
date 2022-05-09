import 'dart:async';

import 'package:cafein_front/Main/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  final String token;
  const SuccessScreen(this.token);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () { //2초후 화면 전환
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen(widget.token)),
      );
    });
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 16,),
            Text("본인 인증이", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25),),
            Spacer(flex: 1,),
            Text("완료되었습니다", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Spacer(flex: 8,),
            Container(
              width: width * 0.4,
                height: width * 0.4,
                child: Image.asset("imgs/success_img.png", )),
            Spacer(flex: 16,),
          ],
        ),
      ),
    );
  }
}
