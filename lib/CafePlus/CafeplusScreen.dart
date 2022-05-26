import 'dart:math';

import 'package:cafein_front/CDS/CafeinButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';

class CafeplusScreen extends StatefulWidget {
  const CafeplusScreen({Key? key}) : super(key: key);

  @override
  _CafeplusScreenState createState() => _CafeplusScreenState();
}

class _CafeplusScreenState extends State<CafeplusScreen> {
  final myController = TextEditingController();
  final myController_wifi = TextEditingController();
  final myController_time = TextEditingController();
  final myController_call = TextEditingController();
  final myController_website = TextEditingController();
  bool textin = false;
  bool feeling_good = false;
  bool feeling_soso = false;
  bool feeling_bad = false;
  int rating_0 = 0;
  int rating_1 = 0;
  int rating_2 = 0;
  int rating_3 = 0;
  bool timeadd = false;
  bool timeadd_end = false;
  String daytime = "오전";
  String hour = "5";
  String minute = "00";
  String daytime_end = "오전";
  String hour_end = "5";
  String minute_end = "00";
  List<String> daytimes = [];
  List<String> daytimes_end = [];
  List<String> hours = [];
  List<String> hours_end = [];
  List<String> minutes = [];
  List<String> minutes_end = [];
  List<String> weeks = [];

  List<bool> picked_list = [false, false, false, false, false, false, false];
  bool plusimage = false;
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    return Scaffold(
      appBar: AppBar(
        title: Text("카공 카페 등록",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios)),
      ),
      bottomSheet: Container(
        width : w_percent * width_whole,
        height: 75 * h_percent,
        color : Colors.white,
        child : Center(
          child: Container(
            width : 328 * w_percent,
            height: 52 * h_percent,
            child : IconButton(
              padding: EdgeInsets.zero, // 패딩 설정
              constraints: BoxConstraints(), // constraints
              onPressed: () {},
              icon: CafeinButtons.OrangeButton(52 * h_percent, 328 * w_percent, "등록하기", true),
            ),

          ),
        )
      ),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: EdgeInsets.only(left : 16 * w_percent, top : 20 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("기본 정보", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800)
                  ),
                  Text("*", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.orange500)
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top : 12 * h_percent),
              child: Container(

                width: width - (w_percent * 32),
                height: h_percent * 48,
                child: TextField(


                  onChanged: (text_message){

                  },
                  cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search , size: 24,color : CafeinColors.grey800),
                    contentPadding: EdgeInsets.all(10.0),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffFC7521))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffACACAC))
                    ),
                  ),
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(top : 10 * h_percent),
              child: Container(

                width: width - (w_percent * 32),
                height: h_percent * 48,
                child: TextField(
                  controller: myController,

                  onChanged: (text_message){
                    textin = true;
                    setState(() {

                    });
                  },
                  cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                  decoration: InputDecoration(
                    suffixIcon: textin ? IconButton(

                      icon:Icon(Icons.cancel, color : CafeinColors.grey300, size : 24), onPressed: (){
                      myController.clear();
                    },) : Container(width: width * 0.00000001,),
                    contentPadding: EdgeInsets.all(10.0),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffFC7521))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffACACAC))
                    ),
                  ),
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : 16 * w_percent, top : 24 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("카공 카페로 어떤가요?", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800)
                  ),
                  Text("*", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.orange500)
                  )
                ],
              ),
            ),
            Container(
              width: width - (30 * w_percent),

              child: Padding(
                padding: EdgeInsets.only(top : 20 * h_percent),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 72 * w_percent,
                      height: 100 * h_percent,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 72 * h_percent,
                            width: 72 * h_percent
                            ,child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {
                              if(feeling_good){
                                feeling_good = !feeling_good;
                              }
                              if(feeling_soso){
                                feeling_soso = !feeling_soso;
                              }
                              feeling_bad = !feeling_bad;

                              setState(() {

                              });
                            },
                            icon: feeling_bad? Image.asset("imgs/badimg_color.png"):Image.asset("imgs/badimg.png"),
                          ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top : 10 * h_percent),
                            child: Text("앗, 별로에요",style: TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : feeling_bad ?Color(0xff333333) : Color(0xffACACAC) ),),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 72 * w_percent,
                      height: 100 * h_percent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 72 * h_percent,
                            width: 72 * h_percent
                            ,child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {

                              if(feeling_good){
                                feeling_good = !feeling_good;
                              }
                              if(feeling_bad){
                                feeling_bad = !feeling_bad;
                              }
                              feeling_soso = !feeling_soso;

                              setState(() {


                              });

                            },
                            icon: feeling_soso ? Image.asset("imgs/sosoimg_color.png"):Image.asset("imgs/sosoimg.png"),
                          ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top : 10 * h_percent),
                            child: Text("그저그래요",style: TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : feeling_soso ?Color(0xff333333) : Color(0xffACACAC) ),),
                          )
                        ],
                      ),

                    ),
                    Container(
                      width: 72 * w_percent,
                      height: 100 * h_percent,
                      child: Column(

                        children: [
                          Container(
                            height: 72 * h_percent,
                            width: 72 * h_percent
                            ,child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {

                              if(feeling_soso){
                                feeling_soso = !feeling_soso;
                              }
                              if(feeling_bad){
                                feeling_bad = !feeling_bad;
                              }
                              feeling_good = !feeling_good;

                              setState(() {


                              });

                            },
                            icon: feeling_good ?  Image.asset("imgs/goodimg_color.png"):Image.asset("imgs/goodimg.png"),
                          ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top : 10 * h_percent),
                            child: Text("추천해요",style: TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : feeling_good ?Color(0xff333333) : Color(0xffACACAC) ),),
                          )
                        ],
                      ),

                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : 16 * w_percent, top : 30 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("카페에 대해 자세히 알려주세요", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800)
                  ),
                  Text("*", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.orange500)
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top : 24 * h_percent, left : 16 * w_percent,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(

                    width: 257 * w_percent,
                    height: 250 * h_percent,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top : 7 * h_percent),
                              child: Text("와이파이", style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff333333) ),),
                            ),
                            Padding(
                              padding:EdgeInsets.only(left : 30 * w_percent),
                              child: Container(
                                width : 176 * w_percent,
                                height: 28 * h_percent,
                                child: RatingBar.builder(
                                    itemCount: 4,
                                    unratedColor: Color(0xffE3E3E3),
                                    itemBuilder: (context, _)=>Icon(Icons.star_rounded, color: Color(0xffFC7521), ),//TODO 평점 모양과 색상 설정
                                    onRatingUpdate: (rating){
                                      rating_0 = rating.toInt();
                                      setState(() {


                                      });
                                    },
                                    itemPadding: EdgeInsets.symmetric(horizontal: 3 * w_percent)
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 8 * h_percent , left: 84 * w_percent),
                          child: Container(
                              height: 15 * h_percent,
                              width: 231 * w_percent,

                              child: Text(_star(1, rating_0), style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff646464) ),)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 12 * h_percent),
                          child: Row(

                            children: [
                              Padding(
                                padding: EdgeInsets.only(top : 7 * h_percent),
                                child: Text("콘센트", style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff333333) ),),
                              ),
                              Padding(
                                padding:EdgeInsets.only(left : 43 * w_percent),
                                child: Container(
                                  width : 176 * w_percent,
                                  height: 28 * h_percent,
                                  child: RatingBar.builder(
                                      itemCount: 4,
                                      unratedColor: Color(0xffE3E3E3),
                                      itemBuilder: (context, _)=>Icon(Icons.star_rounded, color: Color(0xffFC7521), ),//TODO 평점 모양과 색상 설정
                                      onRatingUpdate: (rating){
                                        rating_1 = rating.toInt();
                                        setState(() {


                                        });

                                      },
                                      itemPadding: EdgeInsets.symmetric(horizontal: 3 * w_percent)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 8 * h_percent , left: 84 * w_percent),
                          child: Container(
                              height: 15 * h_percent,
                              width: 231 * w_percent,

                              child: Text(_star(0, rating_1) ,style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff646464) ),)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 12 * h_percent),
                          child: Row(

                            children: [
                              Padding(
                                padding: EdgeInsets.only(top : 7 * h_percent),
                                child: Text("화장실", style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff333333) ),),
                              ),
                              Padding(
                                padding:EdgeInsets.only(left : 43 * w_percent),
                                child: Container(
                                  width : 176 * w_percent,
                                  height: 28 * h_percent,
                                  child: RatingBar.builder(
                                      itemCount: 4,
                                      unratedColor: Color(0xffE3E3E3),
                                      itemBuilder: (context, _)=>Icon(Icons.star_rounded, color: Color(0xffFC7521), ),//TODO 평점 모양과 색상 설정
                                      onRatingUpdate: (rating){
                                        rating_2 = rating.toInt();
                                        setState(() {


                                        });

                                      },
                                      itemPadding: EdgeInsets.symmetric(horizontal: 3 * w_percent)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 8 * h_percent , left: 84 * w_percent),
                          child: Container(
                              height: 15 * h_percent,
                              width: 231 * w_percent,

                              child: Text(_star(2, rating_2), style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff646464) ),)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 12 * h_percent),
                          child: Row(

                            children: [
                              Padding(
                                padding: EdgeInsets.only(top : 7 * h_percent),
                                child: Text("테이블", style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff333333) ),),
                              ),
                              Padding(
                                padding:EdgeInsets.only(left : 43 * w_percent),
                                child: Container(
                                  width : 176 * w_percent,
                                  height: 28 * h_percent,
                                  child: RatingBar.builder(
                                      itemCount: 4,
                                      unratedColor: Color(0xffE3E3E3),
                                      itemBuilder: (context, _)=>Icon(Icons.star_rounded, color: Color(0xffFC7521), ),//TODO 평점 모양과 색상 설정
                                      onRatingUpdate: (rating){
                                        rating_3 = rating.toInt();
                                        setState(() {


                                        });

                                      },
                                      itemPadding: EdgeInsets.symmetric(horizontal: 3 * w_percent)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 8 * h_percent , left: 84 * w_percent),
                          child: Container(
                              height: 15 * h_percent,
                              width: 231 * w_percent,

                              child: Text(_star(3, rating_3), style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff646464) ),)),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : 16 * w_percent, top : 20 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("와이파이 비밀번호", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800)
                  ),
                  Text("(선택)", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey400)
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top : 13 * h_percent),
              child: Container(

                width: width - (w_percent * 32),
                height: h_percent * 48,
                child: TextField(
                  controller: myController_wifi,

                  onChanged: (text_message){
                    textin = true;
                    setState(() {

                    });
                  },
                  cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                  decoration: InputDecoration(
                    suffixIcon: textin ? IconButton(

                      icon:Icon(Icons.cancel, color : CafeinColors.grey300, size : 24), onPressed: (){
                      myController_wifi.clear();
                    },) : Container(width: width * 0.00000001,),
                    contentPadding: EdgeInsets.all(10.0),
                    hintText:"카페 와이파이 비밀번호를 입력해주세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffFC7521))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffACACAC))
                    ),
                  ),
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : 16 * w_percent, top : 20 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("운영시간", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800)
                  ),
                  Text("(선택)", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey400)
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top :12 * h_percent),
              child: _times(w_percent, h_percent, width),
            ),
            Padding(
              padding: EdgeInsets.only(left : 16 * w_percent, top : 20 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("기타 운영 시간", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800)
                  ),
                  Text("(선택)", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey400)
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top : 13 * h_percent),
              child: Container(

                width: width - (w_percent * 32),
                height: h_percent * 48,
                child: TextField(
                  controller: myController_time,

                  onChanged: (text_message){
                    textin = true;
                    setState(() {

                    });
                  },
                  cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                  decoration: InputDecoration(
                    suffixIcon: textin ? IconButton(

                      icon:Icon(Icons.cancel, color : CafeinColors.grey300, size : 24), onPressed: (){
                      myController_time.clear();
                    },) : Container(width: width * 0.00000001,),
                    contentPadding: EdgeInsets.all(10.0),
                    hintText:"ex. 매달 첫째주 월요일",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffFC7521))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffACACAC))
                    ),
                  ),
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : 16 * w_percent, top : 20 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("전화번호", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800)
                  ),
                  Text("(선택)", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey400)
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top : 13 * h_percent),
              child: Container(

                width: width - (w_percent * 32),
                height: h_percent * 48,
                child: TextField(
                  controller: myController_call,

                  onChanged: (text_message){
                    textin = true;
                    setState(() {

                    });
                  },
                  cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                  decoration: InputDecoration(
                    suffixIcon: textin ? IconButton(

                      icon:Icon(Icons.cancel, color : CafeinColors.grey300, size : 24), onPressed: (){
                      myController_call.clear();
                    },) : Container(width: width * 0.00000001,),
                    contentPadding: EdgeInsets.all(10.0),
                    hintText:"카페 전화번호를 입력해 주세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffFC7521))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffACACAC))
                    ),
                  ),
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : 16 * w_percent, top : 20 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("웹사이트", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800)
                  ),
                  Text("(선택)", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey400)
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top : 13 * h_percent),
              child: Container(

                width: width - (w_percent * 32),
                height: h_percent * 48,
                child: TextField(
                  controller: myController_website,

                  onChanged: (text_message){
                    textin = true;
                    setState(() {

                    });
                  },
                  cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                  decoration: InputDecoration(
                    suffixIcon: textin ? IconButton(

                      icon:Icon(Icons.cancel, color : CafeinColors.grey300, size : 24), onPressed: (){
                      myController_website.clear();
                    },) : Container(width: width * 0.00000001,),
                    contentPadding: EdgeInsets.all(10.0),
                    hintText:"카페 홈페이지 주소를 입력해 주세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffFC7521))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffACACAC))
                    ),
                  ),
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : 16 * w_percent, top : 20 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("장소 사진", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800)
                  ),
                  Text("(선택)", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey400)
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left :26 * w_percent , top : 16 * h_percent),
              child: Container(
                height: 64 * h_percent,

                child: Row(
                  children: [
                    Container(
                      width: 64 * w_percent,
                      height: 64 * w_percent
                      ,child: IconButton(
                      padding: EdgeInsets.zero, // 패딩 설정
                      constraints: BoxConstraints(), // constraints
                      onPressed: () {


                        //이미지 picker
                      },
                      icon: Container(
                        width: 64 * w_percent,
                        height: 64 * w_percent,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0,
                              color: Color(0xffD1D1D1)
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(5.0) // POINT
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top : 9 * h_percent),
                              child: Icon(Icons.photo_camera, size : 28, color : Color(0xffACACAC)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top : 6 * h_percent),
                              child: Container(
                                width: 20 * w_percent,
                                child: Row(
                                  children: [
                                    Text("0", style : TextStyle(fontFamily: 'MainFont', fontSize:13, fontWeight: FontWeight.w400, color : Color(0xffFC6406))),
                                    Text("/5",  style : TextStyle(fontFamily: 'MainFont', fontSize:13, fontWeight: FontWeight.w400, color : CafeinColors.grey400)),


                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ),
                    plusimage ? Container() :Padding(
                      padding: EdgeInsets.only(left : 12 * w_percent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width : 164 * w_percent,
                            height: 34 * h_percent,
                            child : IconButton(
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(), // constraints
                              onPressed: () {
                                plusimage = true;
                                setState(() {


                                });
                              },
                              icon: Image.asset("imgs/plusimgimg.png"),
                            ),

                          ),
                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top : 30 * h_percent),
              child: Container(
                width : w_percent * width_whole,
                height: 210 * h_percent,
                color : Color(0xffF6F6F6),
                child: Padding(
                  padding: EdgeInsets.only(top : 24 * h_percent),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width : 328 * w_percent,
                        height: 88 * h_percent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("안내 사항", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey400) ),
                            Padding(
                              padding: EdgeInsets.only(top : 12 * h_percent),
                              child: Text("카공인에게 도움이 될 수 있는 정보를 공유해 주세요. 부적절한 정보가 등록될 경우 카페인 운영정책에 따라 게시물이 삭제 될 수 있어요.", style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey400) ),
                            )
                          ],

                        ),

                      ),
                    ],
                  ),
                ),
              ),
            )
          ],

        ),


      ),

    );
  }
  Widget _times(double w_percent, double h_percent, double width){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(

          width: width - 32 * w_percent,
          height: 44 * h_percent + (56 * h_percent * weeks.length),

          child: Column(

            children: [
              Container(
                height: 44 * h_percent,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 44 * h_percent,
                      width: 108 * w_percent
                      ,child: IconButton(
                        padding: EdgeInsets.zero, // 패딩 설정
                        constraints: BoxConstraints(), // constraints
                        onPressed: () {

                          showModalBottomSheet(shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),

                          ),context: context, builder: (BuildContext timesheetcontext){

                            return _timeSheet(w_percent, h_percent, timesheetcontext, 0);
                          });
                        },
                        icon: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: CafeinColors.grey400,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                            height: 44 * h_percent,
                            width: 108 * w_percent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(timeadd ? daytime.toString() + hour + ":" +minute:"시작 시간",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                              Icon(Icons.keyboard_arrow_down_rounded, color : CafeinColors.grey600,size : 24)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left : 16 * w_percent),
                      child: Container(
                        height: 44 * h_percent,
                        width: 108 * w_percent
                        ,child: IconButton(
                        padding: EdgeInsets.zero, // 패딩 설정
                        constraints: BoxConstraints(), // constraints
                        onPressed: () {

                          showModalBottomSheet(shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),

                          ),context: context, builder: (BuildContext timesheetcontext){

                            return _timeSheet(w_percent, h_percent, timesheetcontext, 1);
                          });
                        },
                        icon: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: CafeinColors.grey400,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          height: 44 * h_percent,
                          width: 108 * w_percent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(timeadd_end ? daytime_end.toString() + hour_end + ":" +minute_end:"시작 시간",   style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                              Icon(Icons.keyboard_arrow_down_rounded, color : CafeinColors.grey600,size : 24)
                            ],
                          ),
                        ),
                      ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left : 16 * w_percent),
                      child: Container(
                        height: 44 * h_percent,
                        width: 79 * w_percent
                        ,child: IconButton(
                        padding: EdgeInsets.zero, // 패딩 설정
                        constraints: BoxConstraints(), // constraints
                        onPressed: () {

                          showModalBottomSheet(shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),

                          ),context: context, builder: (BuildContext weeksheetcontext){

                            return _weekSheet(w_percent, h_percent, weeksheetcontext);
                          });
                        },
                        icon: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: CafeinColors.grey400,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          height: 44 * h_percent,
                          width: 84 * w_percent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("반복",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                              Icon(Icons.keyboard_arrow_down_rounded, color : CafeinColors.grey600,size : 24)
                            ],
                          ),
                        ),
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 56 * h_percent * weeks.length,
                width : w_percent * width_whole,
                child: ListView.builder(
                    itemCount: weeks.length,
                    itemBuilder: (BuildContext context , int index){

                  return Container(
                    width : w_percent * width_whole,
                    height: 56 * h_percent,
                    child: Padding(
                      padding: EdgeInsets.only(top : 16 * h_percent),
                      child: Container(
                        decoration: BoxDecoration(
                            color : CafeinColors.grey050,
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        ),

                        width :  w_percent * width_whole - (32 * w_percent),
                        height: 44 * h_percent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(

                                  width: (w_percent * width_whole - (32 * w_percent)) * 0.7,
                                  child: Padding(
                                    padding: EdgeInsets.only(left : 10 * w_percent),
                                    child: Text(daytimes[index] + " "+hours[index] + ":" + minutes[index] + " ~ " + daytimes_end[index] + " " + hours_end[index] + ":" + minutes_end[index] + "  "+weeks[index],  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                                  ),
                                ),
                                Container(

                                  width: (w_percent * width_whole - (32 * w_percent)) * 0.3,
                                  height: 24 * h_percent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right : 10 * w_percent),
                                        child: Container(

                                          height: 24 * h_percent,
                                          width: 24 * h_percent,
                                          child: IconButton(
                                            padding: EdgeInsets.zero, // 패딩 설정
                                            constraints: BoxConstraints(), // constraints
                                            onPressed: () {
                                              _cancelDialog(h_percent, w_percent, index);

                                            },
                                            icon: Icon(Icons.cancel, color: CafeinColors.grey400,),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _timeSheet(double w_percent, double h_percent, BuildContext timesheetcontext, int startOrend){

    return Container(
      height: 265 * h_percent,
      decoration: BoxDecoration(
          color : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),

          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48 * h_percent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width : w_percent * width_whole * 0.5,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left : 24 * w_percent, top : 21 * h_percent),


                        child : Container(
                          height: 16 * h_percent,
                          width: 27 * w_percent,
                          child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {
                              Navigator.pop(timesheetcontext);

                            },
                            icon: Text("취소",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
                          ),
                        ),

                      )
                    ],
                  ),
                ),
                Container(
                    width : w_percent * width_whole * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right :24 * w_percent , top : 21 * h_percent),
                        child: Container(
                          height: 16 * h_percent,
                          width: 27 * w_percent,
                          child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {
                              startOrend==0 ? timeadd = true : timeadd_end = true;
                              setState(() {

                              });
                              Navigator.pop(timesheetcontext);


                            },
                            icon: Text("확인",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.orange500) ),
                          ),
                        ),
                      )
                    ],
                  ),

                )
              ],
            ),
          ),
          Container(
            height: 197 * h_percent,
            width: 200 * w_percent,

            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width : 50 * w_percent,
                  child: WheelChooser(
                    onValueChanged: (s) {
                      startOrend == 0 ?daytime = s : daytime_end = s;
                      print(s);
                    },

                    datas: _datas(startOrend),
                    unSelectTextStyle: TextStyle(color : CafeinColors.grey600, fontSize: 20 , fontWeight: FontWeight.w400, fontFamily: 'MainFont'),
                      selectTextStyle:TextStyle(color : CafeinColors.grey800, fontSize: 20 , fontWeight: FontWeight.w400, fontFamily: 'MainFont')
                  ),
                ),
                Container(
                  width : 50 * w_percent,
                  child: WheelChooser.integer(
                    onValueChanged: (s) =>  startOrend == 0 ?hour = s.toString() : hour_end = s.toString(),
                    maxValue: 12,
                    minValue: 1,
                    initValue: _inittime(startOrend),

                    unSelectTextStyle: TextStyle(color : CafeinColors.grey600, fontSize: 20 , fontWeight: FontWeight.w400, fontFamily: 'MainFont', ),
                    selectTextStyle:TextStyle(color : CafeinColors.grey800, fontSize: 20 , fontWeight: FontWeight.w400, fontFamily: 'MainFont') ,
                  ),
                ),
                Container(
                  width : 50 * w_percent,
                  child: WheelChooser(
                    onValueChanged: (s) =>  startOrend == 0 ?minute = s : minute_end = s,
                    datas: ["00", "10", "20", "30" , "40" , "50"],
                    unSelectTextStyle: TextStyle(color : CafeinColors.grey600, fontSize: 20 , fontWeight: FontWeight.w400, fontFamily: 'MainFont'),
                    selectTextStyle:TextStyle(color : CafeinColors.grey800, fontSize: 20 , fontWeight: FontWeight.w400, fontFamily: 'MainFont') ,
                  ),
                )
              ],

            )
          )
        ],

      ),
    );
  }

  Widget _weekSheet(double w_percent, double h_percent, BuildContext weeksheetcontext){
    picked_list = [false, false, false, false, false, false, false];
    return StatefulBuilder(builder: (BuildContext builder , StateSetter setStatebuttom){
      return Container(
        height: 480 * h_percent,
        decoration: BoxDecoration(
            color : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),

            )
        ),
        child: Column(
          children: [
            Container(
              height: 48 * h_percent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width : w_percent * width_whole * 0.5,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left : 24 * w_percent, top : 21 * h_percent),


                          child : Container(
                            height: 16 * h_percent,
                            width: 27 * w_percent,
                            child: IconButton(
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(), // constraints
                              onPressed: () {
                                Navigator.pop(weeksheetcontext);

                              },
                              icon: Text("취소",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
                            ),
                          ),

                        )
                      ],
                    ),
                  ),
                  Container(
                    width : w_percent * width_whole * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right :24 * w_percent , top : 21 * h_percent),
                          child: Container(
                            height: 16 * h_percent,
                            width: 27 * w_percent,
                            child: IconButton(
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(), // constraints
                              onPressed: () async {


                                daytimes.add(daytime);
                                daytimes_end.add(daytime_end);

                                hours.add(hour);
                                hours_end.add(hour_end);

                                minutes.add(minute);
                                minutes_end.add(minute_end);
                                String a = "";
                                for(int i = 0 ; i < 7 ;i ++){
                                  
                                  if(picked_list[i]){
                                    if(i == 0){
                                      a += "월,";
                                    }if(i ==1){
                                      a += "화,";
                                    }if(i ==2){
                                      a += "수,";
                                    }if(i ==3){
                                      a += "목,";
                                    }if(i ==4){
                                      a += "금,";
                                    }if(i ==5){
                                      a += "토,";
                                    }if(i ==6){
                                      a += "일,";
                                    }
                                  }
                                }
                                print(a);
                                weeks.add(a.substring(0, a.length-1));
                                for(int i = 0 ;i < weeks.length; i ++){
                                  print(weeks[i] + "   0000000" + i.toString() + "번쨰");
                                }
                                picked_list = [false, false, false, false, false, false, false];
                                setState(() {

                                });

                                Navigator.pop(weeksheetcontext);

                                

                              },
                              icon: Text("확인",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.orange500) ),
                            ),
                          ),
                        )
                      ],
                    ),

                  )
                ],
              ),
            ),
        Container(
          width : w_percent * width_whole,
          height: 56 * h_percent,
          child: IconButton(
            padding: EdgeInsets.zero, // 패딩 설정
            constraints: BoxConstraints(), // constraints
            onPressed: () {
              picked_list[0] = !picked_list[0];
              setStatebuttom(() {

              });
            },
            icon: Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    width : w_percent * width_whole *0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left : 24 * w_percent),
                          child: Text("월요일",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color :  picked_list[0] ? CafeinColors.orange500:CafeinColors.grey800) ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width : w_percent * width_whole *0.5,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left : 24 * w_percent),
                          child: Padding(
                            padding: EdgeInsets.only(right : 16 *w_percent),
                            child: Icon(Icons.check, size : 24, color :  picked_list[0] ? CafeinColors.orange500:CafeinColors.grey800),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
            Container(
              width : w_percent * width_whole,
              height: 56 * h_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {
                  picked_list[1] = !picked_list[1];
                  setStatebuttom(() {

                  });
                },
                icon: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        width : w_percent * width_whole *0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Text("화요일",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : picked_list[1] ? CafeinColors.orange500:CafeinColors.grey800) ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width : w_percent * width_whole *0.5,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Padding(
                                padding: EdgeInsets.only(right : 16 *w_percent),
                                child: Icon(Icons.check, size : 24, color : picked_list[1] ? CafeinColors.orange500:CafeinColors.grey800)),
                              ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width : w_percent * width_whole,
              height: 56 * h_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {
                  picked_list[2] = !picked_list[2];
                  setStatebuttom(() {

                  });
                },
                icon: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        width : w_percent * width_whole *0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Text("수요일",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color :  picked_list[2] ? CafeinColors.orange500:CafeinColors.grey800) ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width : w_percent * width_whole *0.5,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Padding(
                                padding: EdgeInsets.only(right : 16 *w_percent),
                                child: Icon(Icons.check, size : 24, color : picked_list[2] ? CafeinColors.orange500:CafeinColors.grey800)),
                              ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width : w_percent * width_whole,
              height: 56 * h_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {
                  picked_list[3] = !picked_list[3];
                  setStatebuttom(() {

                  });
                },
                icon: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        width : w_percent * width_whole *0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Text("목요일",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color :  picked_list[3] ? CafeinColors.orange500:CafeinColors.grey800) ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width : w_percent * width_whole *0.5,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Padding(
                                padding: EdgeInsets.only(right : 16 *w_percent),
                                child: Icon(Icons.check, size : 24, color : picked_list[3] ? CafeinColors.orange500:CafeinColors.grey800),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width : w_percent * width_whole,
              height: 56 * h_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {
                  picked_list[4] = !picked_list[4];
                  setStatebuttom(() {

                  });
                },
                icon: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        width : w_percent * width_whole *0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Text("금요일",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color :  picked_list[4] ? CafeinColors.orange500:CafeinColors.grey800) ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width : w_percent * width_whole *0.5,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Padding(
                                padding: EdgeInsets.only(right : 16 *w_percent),
                                child: Icon(Icons.check, size : 24, color : picked_list[4] ? CafeinColors.orange500:CafeinColors.grey800),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width : w_percent * width_whole,
              height: 56 * h_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {
                  picked_list[5] = !picked_list[5];
                  setStatebuttom(() {

                  });
                },
                icon: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        width : w_percent * width_whole *0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Text("토요일",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : picked_list[5] ? CafeinColors.orange500:CafeinColors.grey800) ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width : w_percent * width_whole *0.5,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Padding(
                                padding: EdgeInsets.only(right : 16 *w_percent),
                                child: Icon(Icons.check, size : 24, color : picked_list[5] ? CafeinColors.orange500:CafeinColors.grey800),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width : w_percent * width_whole,
              height: 56 * h_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {
                  picked_list[6] = !picked_list[6];
                  setStatebuttom(() {

                  });
                },
                icon: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        width : w_percent * width_whole *0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Text("일요일",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color :  picked_list[6] ? CafeinColors.orange500:CafeinColors.grey800) ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width : w_percent * width_whole *0.5,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 24 * w_percent),
                              child: Padding(
                                padding: EdgeInsets.only(right : 16 *w_percent),
                                child: Icon(Icons.check, size : 24, color : picked_list[6] ? CafeinColors.orange500:CafeinColors.grey800),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      );
    });


  }

  Future<bool> _cancelDialog(double h_percent, double w_percent, int index) async{
    return await showDialog(context: context, builder: (BuildContext dialogcontext){
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Container(
          decoration: BoxDecoration(
            color : Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(1.0) // POINT
            ),
          ),
          height: 119 * h_percent,
          width: 280 * w_percent ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top : 22 * h_percent),
                child: Text("등록된 운영 시간을 삭제할까요?",  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
              ),
              Padding(
                padding: EdgeInsets.only(top : 30 * h_percent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width : 51 * w_percent,
                      height: 36 * h_percent,
                      child: IconButton(
                        padding: EdgeInsets.zero, // 패딩 설정
                        constraints: BoxConstraints(), // constraints
                        onPressed: () {
                          Navigator.pop(dialogcontext);
                        },
                        icon: Center(
                          child: Text("취소",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : Color(0xff2563EB)) ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right : 8  *w_percent),
                      child: Container(
                        width : 51 * w_percent,
                        height: 36 * h_percent,
                        child: IconButton(
                          padding: EdgeInsets.zero, // 패딩 설정
                          constraints: BoxConstraints(), // constraints
                          onPressed: () {
                            daytimes_end.removeAt(index);
                            daytimes.removeAt(index);
                            hours_end.removeAt(index);
                            hours.removeAt(index);
                            minutes_end.removeAt(index);
                            minutes.removeAt(index);
                            weeks.removeAt(index);
                            Navigator.pop(dialogcontext);
                            setState(() {

                            });

                          },
                          icon: Center(
                            child: Text("삭제",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : Color(0xffD83232)) ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )

        ),
      );
    });

  }

  List<String> _datas(int startOrend){
    if(startOrend == 0){
      if(timeadd){
        if(daytime == "오전"){
          return ["오전","오후"];
        }else{
          return["오후", "오전"];
        }
      }
    }
    if(startOrend == 1){
      if(timeadd_end){
        if(daytime_end == "오전"){
          return ["오전","오후"];
        }else{
          return["오후", "오전"];
        }
      }
    }
    return["오전","오후"];
  }
  int _inittime(int startOrend){
    if(startOrend == 0){
      if(timeadd){
        return stringToInt(hour);
      }
    }
    if(startOrend == 0){
      if(timeadd_end){
        return stringToInt(hour_end);
      }
    }
    return 5;
  }



  String _star(int version, int ratings){
    if(version == 0){
      if(ratings == 1){
        return "바닥을 기어봐도 없어요";
      }if(ratings == 2){
        return "찾기 힘들어요";
      }if(ratings == 3){
        return "여유 있어요";
      }if(ratings == 4){
        return "모든 자리에 있어요";
      }
    }
    if(version == 1){
      if(ratings == 1){
        return "없어요 그냥 없어요";
      }if(ratings == 2){
        return "자주 끊겨서 화나요";
      }if(ratings == 3){
        return "그냥저냥 쓸 만해요";
      }if(ratings == 4){
        return "빵빵 잘 터져요";
      }
    }
    if(version == 2){
      if(ratings == 1){
        return "없어요 그냥 없어요";
      }if(ratings == 2){
        return "이용하기 꺼려져요";
      }if(ratings == 3){
        return "그냥저냥 쓸 만해요";
      }if(ratings == 4){
        return "화장실 맛집이에요";
      }
    }
    if(version == 3){
      if(ratings == 1){
        return "카공을 허락하지 않아요";
      }if(ratings == 2){
        return "오래 쓰면 몸이 아파요";
      }if(ratings == 3){
        return "그냥저냥 쓸 만해요";
      }if(ratings == 4){
        return "매우 편하게 사용 가능해요";
      }
    }

    return " ";
  }
}
