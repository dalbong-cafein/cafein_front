import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Center(
            child: Image.asset("imgs/loginscreen_background.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 440, left: 442),
            child: IconButton(

              icon: Image.asset("imgs/Kakao_login_img.png"),
              iconSize: 300, onPressed: () {

            },

            ),
          )
        ],

      )

    );
  }
}

