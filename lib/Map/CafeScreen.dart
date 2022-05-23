import 'dart:async';
import 'dart:convert';

import 'package:cafein_front/CDS/CafeinButtons.dart';
import 'package:cafein_front/CDS/CafeinColors.dart';
import 'package:cafein_front/CDS/CafeinStoreStatus.dart';
import 'package:cafein_front/Main/MainScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';


import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../Review/ReviewScreen2.dart';
var offset = 0.0;

DateTime now = DateTime.now();

Completer<NaverMapController> _controller = Completer();
final ScrollController _scrollController = ScrollController();

class CafeScreen extends StatefulWidget {
  final String token;
  final int id;
  const CafeScreen(this.token, this.id);

  @override
  _CafeScreenState createState() => _CafeScreenState();
}

class _CafeScreenState extends State<CafeScreen> {

  String date = DateFormat('E', 'ko_KR').format(now);
  bool weektime = false;
  var cafe_data;
  @override
  void initState() {
    if(cafe_data == null){
      _loadCafe();
    }


    super.initState();


  }
  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }



  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      offset = _scrollController.offset;
      //print('offset = ${_scrollController.offset}');

    });

    for(int i = 0 ; i < 10000 ;i ++){

      Timer(Duration(seconds: 1), () { //2초후 화면 전환
        setState(() {

        });
      });

    }

    print(date);

    var map = NaverMap(
      mapType: MapType.Basic,
      onMapCreated: _onMapCreated,
    );

    initializeDateFormatting('ko_KR', null);
    var close_time;

    // if(date == '월'){
    //   date = 'onMon';
    // }if(date == '화'){
    //   date = 'onTue';
    //
    // }if(date == '수'){
    //   date = 'onWed';
    // }if(date == '목'){
    //   date = 'onThu';
    // }if(date == '금'){
    //   date = 'onFri';
    // }if(date == '토'){
    //   date = 'onSat';
    // }else{
    //   date = 'onSun';
    // }

    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;

    return GestureDetector(
      onForcePressStart: (d){
        print("hhhh");
      },
      onPanUpdate: (details){

      },
      onTapDown: (d){
        print("i");
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(w_percent, h_percent, offset),
        body: SingleChildScrollView(
          controller: _scrollController,

          child: Column(
            children: [
              Container(
                width: width,
                height: 44 * height / height_whole,

              ),
              Container( //사진부분
                width: width,
                height: 186 * height / height_whole,

                child: _images(h_percent, w_percent, 3),
              ),
              Container(

                  width: width,
                  height: 195 * height / height_whole,
                  child: Column(

                    children: [
                      Padding(
                        padding: EdgeInsets.only(top : 16 *h_percent, left : 20 * w_percent),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 20 * width / width_whole,
                              height: 20 * width / width_whole,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(cafe_data['data']["memberImageDto"]["imageUrl"]),
                                    fit: BoxFit.fill
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left : 6 * width / width_whole),
                              child: Row(
                                children: [
                                  Text("다봉", style: TextStyle(fontFamily: 'MainFont', fontSize: 12, fontWeight: FontWeight.w600, color : Color(0xff646464)),),
                                  Text("님의 제보", style: TextStyle(fontFamily: 'MainFont', fontSize: 12, fontWeight: FontWeight.w400, color : Color(0xff646464)),)
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left : 20 * w_percent,top : 14 * h_percent ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(cafe_data['data']['storeName'], style: TextStyle(fontFamily: 'MainFont', fontSize: 18, fontWeight: FontWeight.w500, color : CafeinColors.grey800),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left : 20 * w_percent,top : 10 * h_percent ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(cafe_data['data']['address']['fullAddress'], style: TextStyle(fontFamily: 'MainFont', fontSize: 14, fontWeight: FontWeight.w400, color : CafeinColors.grey800),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left : 20 * w_percent, top : 10 * h_percent),
                        child: CafeinStoreStatus.plusOpenStatus(h_percent, w_percent, true, 0),
                      )

                      ,Padding(
                        padding: EdgeInsets.only(top : 24 * h_percent),
                        child: Container(
                          width:width,
                          height: 34 * h_percent,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(

                              width: 180 * w_percent,
                              height: 34 * height / height_whole,
                              child: Padding(
                                padding: EdgeInsets.only(left : 55 * w_percent),
                                child: Container(
                                  width : w_percent * 70,
                                  height: 24 * h_percent,
                                  child: IconButton(
                                    padding: EdgeInsets.zero, // 패딩 설정
                                    constraints: BoxConstraints(), // constraints
                                    onPressed: () {

                                    },
                                    icon: Row(
                                      children: [
                                        ImageIcon(
                                          AssetImage("imgs/righticon.png"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left : 10 * width/ width_whole),
                                          child: Text("길찾기",style: TextStyle(fontFamily: 'MainFont', fontSize: 14, fontWeight: FontWeight.w600, color : Color(0xff646464)) ),
                                        )
                                      ],

                                    ),
                                  ),
                                ),
                              ),

                            ),
                              Container(
                                width: 1 * w_percent,
                                height: 34 * h_percent,
                                color: Color(0xffEFEFEF),
                              ),
                              Container(
                                width: 180 * w_percent,
                                height: 34 * height / height_whole,
                                child: Padding(
                                  padding: EdgeInsets.only(left : 51 * w_percent),
                                  child: Container(
                                    width : w_percent * 77,
                                    height: 24 * h_percent,
                                    child: IconButton(
                                      padding: EdgeInsets.zero, // 패딩 설정
                                      constraints: BoxConstraints(), // constraints
                                      onPressed: () {

                                      },
                                      icon: Container(

                                        child: Row(
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero, // 패딩 설정
                                              constraints: BoxConstraints(), // constraints
                                              onPressed: () {},
                                              icon: Icon(Icons.favorite_border, size : 24),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left : 10 * width/ width_whole),
                                              child: Text("저장 12",style: TextStyle(fontFamily: 'MainFont', fontSize: 14, fontWeight: FontWeight.w600, color : Color(0xff646464)) ),
                                            )
                                          ],

                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
              Container(

                width: width,
                height: 10 * height / height_whole,
                color: Color(0xffF6F6F6),
              ),
              Container(
                width : width,
                height: 45 * h_percent,
                child: Row(
                  children: [
                    Container(
                      width : width * 0.25,
                      height: 45 * h_percent,
                      child: Column(
                        children: [
                          Container(
                            height: 44 * h_percent,
                            width: width * 0.25,
                            child: IconButton(
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(), // constraints
                              onPressed: () {},
                              icon: Container(

                                  height: 44 * h_percent
                                  ,child: Center(child: Text("카공 정보", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),)),
                            ),
                          ),
                          Container( height: 1* h_percent,
                            width:width * 0.25,
                            color:Colors.black,)
                        ],
                      ),
                    ),
                    Container(
                      width : width * 0.25,
                      height: 45 * h_percent,
                      child: Column(
                        children: [
                          Container(
                            height: 44 * h_percent,
                            width:width * 0.25,
                            child: IconButton(
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(), // constraints
                              onPressed: () {},
                              icon: Container(

                                  height: 44 * h_percent
                                  ,child: Center(child: Text("혼잡도", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),)),
                            ),
                          ),
                          Container( height: 1* h_percent,
                            width:width *0.25,
                            color:Colors.black,)
                        ],
                      ),
                    ),
                    Container(
                      width : width * 0.25,
                      height: 45 * h_percent,
                      child: Column(
                        children: [
                          Container(
                            height: 44 * h_percent,
                            width:width * 0.25,
                            child: IconButton(
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(), // constraints
                              onPressed: () {},
                              icon: Container(

                                  height: 44 * h_percent
                                  ,child: Center(child: Text("리뷰",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' ),),)),
                            ),
                          ),
                          Container( height: 1* h_percent,
                            width:width * 0.25,
                            color:Colors.black,)
                        ],
                      ),
                    ),
                    Container(
                      width : width * 0.25,
                      height: 45 * h_percent,
                      child: Column(
                        children: [
                          Container(
                            height: 44 * h_percent,
                            width: width * 0.25,
                            child: IconButton(
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(), // constraints
                              onPressed: () {},
                              icon: Container(

                                  height: 44 * h_percent
                                  ,child: Center(child: Text("기본 정보", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),)),
                            ),
                          ),
                          Container( height: 1* h_percent,
                            width:width * 0.25,
                            color:Colors.black,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 383 * h_percent,
                width:  width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top : 25 * h_percent, left : 16 * w_percent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("카공 정보", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700, fontFamily: 'MainFont' )),
                          Padding(
                            padding: EdgeInsets.only(left : 4 * w_percent),
                            child: Container(
                              height: 20 * h_percent,
                              width: 20 * h_percent,

                              child: IconButton(
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(), // constraints
                                onPressed: () {},
                                icon: Icon(Icons.help_outline, color : CafeinColors.grey400, size : 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * h_percent),
                      child: Container(
                        width : 328 * w_percent,
                        height: 268 * h_percent,

                        child: Column(
                          children: [
                            Container(
                              width : 328 * w_percent,
                              height: 52 * h_percent,
                              decoration:  BoxDecoration(
                                border: Border.all(
                                  width: 1.2,
                                  color: CafeinColors.orange400,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8.0) // POINT
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text("리뷰를 쓴 사람 중 ", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' )),
                                      Text("32%", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.orange500)),
                                      Text(" 가 카공 카페로 추천했어요.", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' ))
                                    ],

                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top : 6 * h_percent),
                              child: Container(
                                width : 328 * w_percent,
                                height: 48 * h_percent,
                                decoration:  BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: CafeinColors.grey100,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0) // POINT
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width : w_percent * 276,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left : 12 * w_percent),
                                            child: Icon(Icons.power, size : 30, color : CafeinColors.grey500 ),
                                          ),
                                          Padding(
                                            padding:EdgeInsets.only(left : 8 * w_percent),
                                            child: Text("콘센트",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),
                                          ),
                                          Padding(
                                            padding:EdgeInsets.only(left : 4 * w_percent),
                                            child: Text("50",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' )),
                                          ),
                                          Text("%이상 자리에서 사용 가능해요",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 50 * w_percent,
                                      height: 48 * h_percent,

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 16 * w_percent),
                                            child: Text("23"),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top : 6 * h_percent),
                              child: Container(
                                width : 328 * w_percent,
                                height: 48 * h_percent,
                                decoration:  BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: CafeinColors.grey100,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0) // POINT
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width : w_percent * 276,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left : 12 * w_percent),
                                            child:Container(
                                                width: 24 * w_percent,
                                                height: 24 * w_percent,
                                                child: Image.asset("imgs/restroomimg.png")),
                                          ),
                                          Padding(
                                            padding:EdgeInsets.only(left : 8 * w_percent),
                                            child: Text("화장실",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left : 4 *w_percent),
                                            child: Text("다시 가고싶지 않아요",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' )),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 50 * w_percent,
                                      height: 48 * h_percent,

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 16 * w_percent),
                                            child: Text("23"),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top : 6 * h_percent),
                              child: Container(
                                width : 328 * w_percent,
                                height: 48 * h_percent,
                                decoration:  BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: CafeinColors.grey100,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0) // POINT
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width : w_percent * 276,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left : 12 * w_percent),
                                            child: Icon(Icons.table_restaurant_outlined, size : 30,color : CafeinColors.grey500 ),
                                          ),
                                          Padding(
                                            padding:EdgeInsets.only(left : 8 * w_percent),
                                            child: Text("테이블",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left : 4 * w_percent),
                                            child: Text("불편해요",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' )),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 50 * w_percent,
                                      height: 48 * h_percent,

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 16 * w_percent),
                                            child: Text("23"),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top : 6 * h_percent),
                              child: Container(
                                width : 328 * w_percent,
                                height: 48 * h_percent,
                                decoration:  BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: CafeinColors.grey100,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0) // POINT
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width : w_percent * 276,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left : 12 * w_percent),
                                            child: Icon(Icons.wifi, size : 30, color : CafeinColors.grey500 ),
                                          ),
                                          Padding(
                                            padding:EdgeInsets.only(left : 8 * w_percent),
                                            child: Text("와이파이",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left : 4 * w_percent),
                                            child: Text("불편해요",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 50 * w_percent,
                                      height: 48 * h_percent,

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 16 * w_percent),
                                            child: Text("23"),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top : 6 * h_percent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left : 30 * w_percent),
                            child: Icon(Icons.wifi, size : 20 , color : CafeinColors.grey400),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left : 8 * w_percent),
                            child: Container(
                              width : w_percent * 180,
                              height: h_percent * 34
                              ,child: IconButton(
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(), // constraints
                                onPressed: () {},
                                icon: Container(
                                    width : w_percent * 180,
                                    height: h_percent * 34,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                      color : Color(0xffD1D1D1)
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0) //                 <--- border radius here
                                    ),
                                  ),
                                  child: Center(child: Text("와이파이 비밀번호 확인하기",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                height: 10 * height / height_whole,
                color: Color(0xffF6F6F6),
              ),
              _confusion(h_percent, w_percent),
              Container(
                width: width,
                height: 10 * height / height_whole,
                color: Color(0xffF6F6F6),
              ),
              _reviewList(h_percent, w_percent),
              Container(
                width: width,
                height: 10 * height / height_whole,
                color: Color(0xffF6F6F6),
              ),
              _map(h_percent, w_percent, map),
              Container(
                width: width,
                height: 10 * height / height_whole,
                color: Color(0xffF6F6F6),
              ),
              _cafeinsPickList(h_percent, w_percent),

            ],
          ),

        ),
      ),
    );
  }

  Widget _confusion(double h_percent, double w_percent){
    return Container(
      width : w_percent * width_whole,
      height: 322 * h_percent,

      child: Column(
        children: [
          Padding(
            padding:EdgeInsets.only(left : 16 * w_percent, top : 22 * h_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("혼잡도", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700, fontFamily: 'MainFont' )),
                Padding(
                  padding: EdgeInsets.only(left : 4 * w_percent),
                  child: Container(
                    height: 20 * h_percent,
                    width: 20 * h_percent,

                    child: IconButton(
                      padding: EdgeInsets.zero, // 패딩 설정
                      constraints: BoxConstraints(), // constraints
                      onPressed: () {},
                      icon: Icon(Icons.help_outline, color : CafeinColors.grey400, size : 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top : 12 * h_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: w_percent * width_whole * 0.5,
                  child: Padding(
                    padding: EdgeInsets.only(left : 16 * w_percent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width : 94 * w_percent,
                          height: 34 * h_percent,

                        ),
                        Padding(
                          padding: EdgeInsets.only(left : 12 *w_percent),
                          child: Text("총 12건", style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600 )),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  width: w_percent * width_whole * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(right: 16 * w_percent),
                        child: Container(
                          width : 115 * w_percent,
                          height: 34 * h_percent,
                          child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {},
                            icon: CafeinButtons.OrangeButton(34 * h_percent, 115 * w_percent, "혼잡도 알려주기", true),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left : 16 * w_percent, top : 16 * h_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _confi_Circle(0, true, w_percent, h_percent),
                Padding(
                  padding: EdgeInsets.only(left : 10 * w_percent),
                  child: Container(
                    height: 32 * h_percent,
                    width: 157 * w_percent,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("다봉", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800 )),
                            Text("님의 제보", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800 ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 3*h_percent),
                          child: Row(
                            children: [
                              Text("30분전", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600 )),
                              Text("·가장 최근에 공유했어요", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.orange500 ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left : 40 * w_percent),
                child: Container(
                  width: 1,
                  height: 16 * h_percent,
                  color: CafeinColors.grey100,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left : 16 * w_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 48 * w_percent,

                    child: Center(child: _confi_Circle(0, false, w_percent, h_percent))),
                Padding(
                  padding: EdgeInsets.only(left : 10 * w_percent),
                  child: Container(
                    height: 32 * h_percent,
                    width: 157 * w_percent,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("다봉", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800 )),
                            Text("님의 제보", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800 ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 3*h_percent),
                          child: Row(
                            children: [
                              Text("30분전", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600 )),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left : 40 * w_percent),
                child: Container(
                  width: 1,
                  height: 16 * h_percent,
                  color: CafeinColors.grey100,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left : 16 * w_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 48 * w_percent,

                    child: Center(child: _confi_Circle(0, false, w_percent, h_percent))),
                Padding(
                  padding: EdgeInsets.only(left : 10 * w_percent),
                  child: Container(
                    height: 32 * h_percent,
                    width: 157 * w_percent,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("다봉", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800 )),
                            Text("님의 제보", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800 ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 3*h_percent),
                          child: Row(
                            children: [
                              Text("30분전", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600 )),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top : 16 * h_percent),
            child: Container(
              width: 155 * w_percent,
              height: 34 * h_percent,
              child: IconButton(

                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {


                },
                icon: Container(

                  width: 155 * w_percent,
                  height: 34 * h_percent,
                  child: Center(child: Container(

                    width: 123 * w_percent,
                    height: 24 * h_percent,
                    child: Row(
                      children: [
                        Text("혼잡도 ", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600 )),
                        Text("9건 더보기", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600 )),
                        Padding(
                          padding: EdgeInsets.only(left : 6 * w_percent, bottom: 6 * h_percent),
                          child: Container(width: 16 * h_percent, height: 16 * h_percent,child: Center(child: Icon(Icons.keyboard_arrow_down_sharp, size: 24,color : CafeinColors.grey400))),
                        )
                      ],
                    ),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _confi_Circle(int con,bool first, double w_percent, double h_percent){
    Color back = Color(0xffDFF5E8);
    Color text_C = Color(0xff26BA6A);
    String text = "여유";

    if(con == 0){
      back = Color(0xffDFF5E8);
      text_C = Color(0xff26BA6A);
      text = "여유";
    }if(con == 1){

    }if(con == 2){

    }
    if(!first){
      back = CafeinColors.grey050;
      text_C = CafeinColors.grey400;
    }
    return Container(
      width : first ? 48 * w_percent:40 * w_percent,
      height : first ? 48 * w_percent:40 * w_percent,
      child: Center(child:Container(
        width : first ? 48 * w_percent:40 * w_percent,
        height : first ? 48 * w_percent:40 * w_percent,
        decoration: BoxDecoration(
          color : back,
          shape: BoxShape.circle
        ),
        child: Center(child: Text(text, style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color :text_C)),),
      ),),
    );
  }
  Widget _reviewList(double h_percent, double w_percent){
    return Container(
      width: w_percent * width_whole,
      height: 676 * w_percent,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left : 16 * w_percent, top : 20 * h_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width : w_percent * 0.6 * width_whole -  16 * w_percent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("카공 리뷰", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),
                    ],
                  ),
                ),
                Container(
                  width : w_percent * 0.4 * width_whole,
                  child: IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewScreen2(widget.token, widget.id)),
                      );

                    },
                    icon:  Container(
                      width : w_percent * 0.5 * width_whole,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right : 6 * w_percent),
                            child: Icon(Icons.edit,size : 16 , color : CafeinColors.orange500),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 16 * w_percent),
                            child: Text("리뷰 쓰기", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' , color : CafeinColors.orange500)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(top : 20 * h_percent),
            child: Container(
              height: 565 * h_percent,
              width: w_percent * width_whole,

              padding: EdgeInsets.zero,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context , int index){

                return _reviewListOne(h_percent, w_percent, index);
              }),
            ),
          ),
          Container(
            width: w_percent * 328,
            height: h_percent * 40,
            child: IconButton(
              padding: EdgeInsets.zero, // 패딩 설정
              constraints: BoxConstraints(), // constraints
              onPressed: () {},
              icon: Container(
                width: w_percent * 328,
                height: h_percent * 40,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color : CafeinColors.grey400
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(8.0) //                 <--- border radius here
                  ),
                ),
                child: Center(child: Text("12개의 리뷰 모두 보기", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800 )),),
              ),
            ),
          ),

        ],
      ),
    );
  }
  Widget _reviewListOne(double h_percent, double w_percent, int index){
    return Container(
      width : w_percent * width_whole,
      height: 193 * h_percent,

      child: Padding(
        padding:EdgeInsets.only(left : 16 * w_percent),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width : 36 * w_percent,
                  height: 36 * w_percent,
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(36 * w_percent), // Image radius
                      child: Image.network('https://googleflutter.com/sample_image.jpg', fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left :8 * w_percent),
                  child: Container(
                    width: 130 * w_percent,
                    height: 32 * h_percent,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("다봉",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),
                        Padding(
                          padding: EdgeInsets.only(top : 2 * h_percent),
                          child: Text("22.03.25 · 3번째 방문",  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'MainFont' , color :CafeinColors.grey400)),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top : 10 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.zero,

                    height: 72 * w_percent,
                    width: w_percent *width_whole - 16 * w_percent,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index){
                          return _imageListOne(h_percent, w_percent);

                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h_percent * 10),
              child: Container(
                width : w_percent * 328,
                height: h_percent * 40,
                child: Text("솔직히 이 카페는 저 혼자만 알고 싶은 카페였는데 같이 작업할 사람이 많아졌으면 좋겠다는 생각이 들었어요",maxLines: 2, style: TextStyle(height: 1.5, fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' , color :Color(0xff646464))),
              ),
            ),
            index == 2 ? Container() : Padding(
              padding: EdgeInsets.only(top : 10 * h_percent),
              child: Container( height:1 * h_percent,
                width: w_percent * width_whole - 16 * w_percent,
                color:Color(0xffEFEFEF),),
            ),


          ],
        ),
      ),
    );
  }
  Widget _imageListOne(double h_percent, double w_percent){
    return Container(
      width: w_percent * 78,
      height: w_percent * 72,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: w_percent * 72,
            height: w_percent * 72,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child: Image.network('https://googleflutter.com/sample_image.jpg', fit: BoxFit.cover),
              ),
            )
            ,
          )
        ],
      ),
    );
  }
  Widget _map(double h_percent, double w_percent, NaverMap map){
    return Container(
      width: w_percent * width_whole,
      height: weektime ? (373 + 166)* h_percent:373* h_percent,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left : 16 * w_percent, top : 20 * h_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("기본 정보", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),

              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(top : 16* h_percent),
            child: Container(

              width: 340 * w_percent,
              height: 140 * h_percent,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  heightFactor: 0.3,
                  widthFactor: 2.5,
                  child: map,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left : 16 * w_percent , top : 18 * h_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 300 * w_percent,
                  height: 24 * h_percent,
                  child: IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {
                      weektime = !weektime;
                      setState(() { });
                    },
                    icon: Container(
                      width: 300 * w_percent,
                      height: 24 * h_percent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.access_time, size : 20 , color :CafeinColors.grey400),
                          Padding(
                            padding: EdgeInsets.only(left : 8 * w_percent),
                            child: Text("영업 중" ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' , color : CafeinColors.orange500)),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left : 4* w_percent),
                            child: Text("오후 에 영업 종료", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' , color : CafeinColors.grey800)),
                          ),
                          Icon(Icons.keyboard_arrow_down, size : 24, color : CafeinColors.grey400)
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          weektime ? _weekTime(w_percent, h_percent) : Container(),
          Padding(
            padding: EdgeInsets.only(left : 16 * w_percent , top : 10 * h_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 300 * w_percent,
                  height: 24 * h_percent,
                  child: IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {},
                    icon:  Container(
                      width: 300 * w_percent,
                      height: 24 * h_percent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.call, size : 20 , color :CafeinColors.grey400),
                          Padding(
                            padding: EdgeInsets.only(left : 8 * w_percent),
                            child: Text("02-123-1234" ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' , color : Color(0xff2563EB))),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),



              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left : 16 * w_percent , top : 10 * h_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 300 * w_percent,
                  height: 24 * h_percent,
                  child: IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {},
                    icon: Container(
                      width: 300 * w_percent,
                      height: 24 * h_percent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.wifi_tethering, size : 20 , color :CafeinColors.grey400),
                          Padding(
                            padding: EdgeInsets.only(left : 8 * w_percent),
                            child: Text("http;eiofjoasjfj" ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' , color : CafeinColors.grey800)),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top : 16  * h_percent),
            child: Container( height:1.0,
              width: 344 * w_percent,
              color:Color(0xffEFEFEF),),
          ),
          Padding(
            padding: EdgeInsets.only(top : 13  * h_percent, left : 16 * w_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width : 170 * w_percent,
                  height: 32 * h_percent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("잘못된 정보가 있다면 알려주세요", style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500, fontFamily: 'MainFont' , color : CafeinColors.grey600)),
                      Padding(
                        padding: EdgeInsets.only(top : 2 * h_percent),
                        child: Text("마지막 수정일 2022.05.15", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'MainFont' , color : CafeinColors.grey400)),
                      )
                    ],
                  )
                ),
              ],
            ),
          )



        ],
      ),
    );
  }
  Widget _cafeinsPickList(double h_percent, double w_percent){
    return Container(
      height: 398 * h_percent,
      width: w_percent * width_whole,
      child:Column(

        children: [
          Padding(
            padding: EdgeInsets.only(top : 20 * h_percent, left : 16 * w_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("카페인'S PICK", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),

              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.only(top : 16 * h_percent),
            child: Container(
              width : w_percent * width_whole - 16 * w_percent,
              height: 214 * h_percent,
              child: ListView.builder(
                itemCount: 8,
                  scrollDirection: Axis.horizontal
                  ,itemBuilder: (BuildContext context, int index){
                return _cafeinsPickListOne(h_percent, w_percent, index);

              }),
            ),
          ),
          Padding(
            padding:EdgeInsets.only(top : 30 * h_percent),
            child: _ad(h_percent, w_percent),
          )
        ],
      )
    );
  }
  Widget _cafeinsPickListOne(double h_percent, double w_percent, int index){

    return Container(
      width: 168 * w_percent,
      height: 214 * h_percent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 160 * w_percent,
            height: 214 * h_percent,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color : Color(0xffD1D1D1)
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)
              ),
            ),
            child:Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 160 *w_percent,
                      height: 100 * h_percent,


                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)), // Image border
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.network('https://picsum.photos/250?image=9', fit: BoxFit.cover),
                        ),
                      )


                    ),
                    Container(
                      width: 160 *w_percent,
                      height: 111 * h_percent,

                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left : 10 * w_percent, top : 8 * h_percent, right : 10 * w_percent),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("투썸플레이스 메세나폴리스 합정", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400, fontFamily: 'MainFont' )),
                            Padding(
                              padding: EdgeInsets.only(top : 6 * h_percent),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CafeinStoreStatus.plusOpenStatus(h_percent, w_percent, true, 0),
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.only(top : 10 * h_percent),
                              child: CafeinStoreStatus.disLikeHeart(999, 99, 99, w_percent, h_percent),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left : 128 * w_percent, top : 8 * h_percent),
                  child: Container(
                    width : 24 * h_percent,
                    height: 24 * h_percent,
                    child: IconButton(
                      padding: EdgeInsets.zero, // 패딩 설정
                      constraints: BoxConstraints(), // constraints
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border, size : 24 , color : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget _ad(double h_percent, double w_percent){
    return Container(
      width : 328 * w_percent,
      height : 72 * h_percent,
      decoration: BoxDecoration(
        color : Color(0xff26BA6A),
        borderRadius: BorderRadius.all(
            Radius.circular(8.0)
        ),
      ),
      child:
        Padding(
          padding: EdgeInsets.only(left : 32 * w_percent),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(

                width : 146 * w_percent,
                height : 38 * h_percent,
                child: Center(child: Text("친구 초대하고 \n무료 아메리카노 쿠폰 받자", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' , color : Colors.white))),
              ),
              Padding(
                padding: EdgeInsets.only(left : 49 * w_percent),
                child: Container(
                  width : 69 * w_percent,
                  height: 59.7 * h_percent,
                  child: Image.asset("imgs/cuponadimg.png"),
                ),
              )
            ],
          ),
        )
    );
  }

  Widget _images(double h_percent, double w_percent , int howmany){
    if(howmany == 1){
      return Container( //사진부분
        width: w_percent * width_whole,
        height: 186 * h_percent,
        child: Image.network('https://googleflutter.com/sample_image.jpg', fit : BoxFit.fitWidth),
      );
    }if(howmany == 2){
      return  Container( //사진부분
        width: w_percent * width_whole,
        height: 186 * h_percent,
        child: Row(
          children: [
            Container(
              width : (w_percent * width_whole - 2 * w_percent)/2,
              height:186 * h_percent,
              child: Image.network('https://googleflutter.com/sample_image.jpg',fit : BoxFit.fitHeight),
            ),
            Padding(
              padding: EdgeInsets.only(left : 2 * w_percent),
              child: Container(
                width : (w_percent * width_whole - 2 * w_percent)/2,
                height:186 * h_percent,
                child: Image.network('https://googleflutter.com/sample_image.jpg',fit : BoxFit.fitHeight),
              ),
            )
          ],
        )
      );
    }if(howmany == 3){
      return Container( //사진부분
          width: w_percent * width_whole,
          height: 186 * h_percent,
          child: Row(
            children: [
              Container(
                width : (w_percent * width_whole - 2 * w_percent)/2,
                height:186 * h_percent,
                child: Image.network('https://googleflutter.com/sample_image.jpg',fit : BoxFit.fitHeight),
              ),
              Padding(
                padding: EdgeInsets.only(left : 2 * w_percent),
                child: Container(
                  width : (w_percent * width_whole - 2 * w_percent)/2,
                  height:186 * h_percent,
                  child: Column(
                    children: [
                      Container(
                        width : (w_percent * width_whole - 2 * w_percent)/2,
                        height:(186 * h_percent - 2 * w_percent)/2,
                        child: IconButton(

                          padding: EdgeInsets.zero, // 패딩 설정
                          constraints: BoxConstraints(), // constraints
                          onPressed: () {

                            print("hell0");
                          },
                          icon: Container(
                              width : (w_percent * width_whole - 2 * w_percent)/2,
                              height:(186 * h_percent - 2 * w_percent)/2,
                              child: Image.network('https://googleflutter.com/sample_image.jpg',fit : BoxFit.fitWidth)),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top : 2 *w_percent),
                        child: Container(
                          width : (w_percent * width_whole - 2 * w_percent)/2,
                          height:(186 * h_percent - 2 * w_percent)/2,
                          child:IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {


                            },
                            icon: Stack(
                              children: [
                                Container(
                                  width : (w_percent * width_whole - 2 * w_percent)/2,
                                  height:(186 * h_percent - 2 * w_percent)/2,
                                  child: Container(
                                      width : (w_percent * width_whole - 2 * w_percent)/2,
                                      height:(186 * h_percent - 2 * w_percent)/2,
                                      child: Image.network('https://googleflutter.com/sample_image.jpg',fit : BoxFit.fitWidth)),
                                ),
                                Opacity(
                                  opacity: 0.4,
                                  child: Container(
                                    width : (w_percent * width_whole - 2 * w_percent)/2,
                                    height:(186 * h_percent - 2 * w_percent)/2,
                                    color: Colors.black,
                                  ),

                                ),
                                Container(
                                  width : (w_percent * width_whole - 2 * w_percent)/2,
                                  height:(186 * h_percent - 2 * w_percent)/2,
                                  child : Center(
                                    child: Text("+ 20", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont' , color : Colors.white)),
                                  )
                                ),
                              ],
                            ),
                          ),


                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
      );
    }
    return Container();
    
    
  }

  PreferredSizeWidget _appBar(double w_percent, double h_percent, double offset){
    if(offset > 257){
      return AppBar(
        backgroundColor: Colors.white,
        title:Text(cafe_data['data']['storeName'], style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
        centerTitle: true,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios)),
      );
    }else{
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios)),
      );
    }

  }
  void _onMapCreated(NaverMapController controller){
    if(_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

  Future<void> _loadCafe() async {

    var dio = new Dio();
    var accesstoken = widget.token;
    dio.options.headers = {'cookie' : "accessToken=$accesstoken"};

    var res_dio = await dio.get("https://api.cafeinofficial.com/stores/"  + widget.id.toString());
    print(res_dio.data['data'].toString() + "가게 정보 ");
    cafe_data = res_dio.data;


    setState(() {

    });
  }

  Widget _weekTime(double w_percent, double h_percent){
    return Container(
      width : w_percent * width_whole,
      height: 166 * h_percent,
      child: Padding(
        padding: EdgeInsets.only(left: 43 * w_percent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top : 8 * h_percent),
              child: Text("월요일 오전 07:30 ~ 오후 11:30", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800 )),
            ),
            Padding(
              padding: EdgeInsets.only(top : 8 * h_percent),
              child: Text("화요일 오전 07:30 ~ 오후 11:30", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800 )),
            ),
            Padding(
              padding: EdgeInsets.only(top : 8 * h_percent),
              child: Text("수요일 오전 07:30 ~ 오후 11:30", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.orange500)),
            ),
            Padding(
              padding: EdgeInsets.only(top : 8 * h_percent),
              child: Text("목요일 오전 07:30 ~ 오후 11:30", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800 )),
            ),
            Padding(
              padding: EdgeInsets.only(top : 8 * h_percent),
              child: Text("금요일 오전 07:30 ~ 오후 11:30", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800 )),
            ),
            Padding(
              padding: EdgeInsets.only(top : 8 * h_percent),
              child: Text("토요일 오전 07:30 ~ 오후 11:30", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800 )),
            ),
            Padding(
              padding: EdgeInsets.only(top : 8 * h_percent),
              child: Text("일요일 오전 07:30 ~ 오후 11:30", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800 )),
            ),


          ],
        ),
      ),
    );
  }
}
