import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';

class Four_SettingScreen extends StatefulWidget {
  final String token;

  const Four_SettingScreen(this.token );

  @override
  _Four_SettingScreenState createState() => _Four_SettingScreenState();
}

class _Four_SettingScreenState extends State<Four_SettingScreen> {
  @override
  var addon = true;

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;

    return Scaffold(
      appBar: AppBar(
        title: Text("설정",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Container(
            width : width,
            height: 56 * h_percent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  width : width * 0.5,
                    child: Padding(
                      padding: EdgeInsets.only(left : 24 * w_percent),
                      child: Text("이벤트/혜택 PUSH 알림", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                    )),

                Container(
                    width : width * 0.5,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right : 24 * w_percent),
                          child: CupertinoSwitch(

                              activeColor: CafeinColors.orange400,
                              value: addon, onChanged: (val){
                              addon = !addon;
                              setState(() {
                                
                              });
                          }
                          ),
                        )
                      ],
                    )

                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top : 10 * h_percent , bottom: 10 * h_percent),
            child: Container( height:1.0 * h_percent,
              width: 328 * w_percent,
              color:Color(0xffEFEFEF),),
          ),
          Container(
            width : width,
            height: 56 * h_percent,
            child: IconButton(
              padding: EdgeInsets.zero, // 패딩 설정
              constraints: BoxConstraints(), // constraints
              onPressed: () {


              },
              icon: Container(
                width : width,
                height: 56 * h_percent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Container(
                        width : width * 0.5,
                        child: Padding(
                          padding: EdgeInsets.only(left : 24 * w_percent),
                          child: Text("버전 정보", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                        )),

                    Container(
                        width : width * 0.5,
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("업데이트하기", style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey400) ),
                            Padding(
                              padding:EdgeInsets.only(right : 24 * w_percent, left : 8 * w_percent),
                              child: Icon(Icons.arrow_forward_ios, size : 20, color : CafeinColors.grey400),
                            )

                          ],
                        )

                    ),

                  ],
                ),
              ),
            ),



          ),

        ],
      ),
    );
  }
}
