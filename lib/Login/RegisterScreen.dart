import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var asset1 = Image.asset("imgs/profile_random_img1.png");
var asset2 = Image.asset("imgs/profile_random_img2.png");
var asset3 = Image.asset("imgs/profile_random_img3.png");


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("닉네임 설정"),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined), color: Colors.black,iconSize: 30,),

        ],

      ),

    );
  }
}
