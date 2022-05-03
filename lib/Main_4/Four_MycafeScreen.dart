import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Four_MycafeScreen extends StatefulWidget {
  final String token;
  const Four_MycafeScreen(this.token);

  @override
  _Four_MycafeScreenState createState() => _Four_MycafeScreenState();
}

class _Four_MycafeScreenState extends State<Four_MycafeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor : Colors.white,title: Text("내가 등록한 카페", style: TextStyle(color : Colors.black, fontSize: 16, fontFamily: 'MainFont', fontWeight: FontWeight.w500),),
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
    );
  }

  Widget _cafeList(int i) {
    return Container();
  }
}