import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Stack(
        children: [
          Center(
            child: Image.asset("imgs/loginscreen_background.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 3.2/5, left: width * 1/20),
            child: IconButton(

              icon: Image.asset("imgs/Kakao_login_img.png"),
              iconSize: 350, onPressed: () {

            },

            ),
          ),

        ],

      )

    );
  }
}

