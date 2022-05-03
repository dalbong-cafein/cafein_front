import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Four_MyreviewScreen extends StatefulWidget {
  final String token;
  const Four_MyreviewScreen(this.token);

  @override
  _Four_MyreviewScreenState createState() => _Four_MyreviewScreenState();
}

class _Four_MyreviewScreenState extends State<Four_MyreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor : Colors.white,title: Text("내가 쓴 리뷰", style: TextStyle(color : Colors.black, fontSize: 16, fontFamily: 'MainFont', fontWeight: FontWeight.w500),),
        centerTitle: true,
        iconTheme:  IconThemeData(
          color: Color(0xff333333),
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color : Color(0xff333333)),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(


        ),
      ),
    );;
  }
}
