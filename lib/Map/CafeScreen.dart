import 'dart:async';

import 'package:cafein_front/CDS/CafeinButtons.dart';
import 'package:cafein_front/CDS/CafeinColors.dart';
import 'package:cafein_front/Main/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

Completer<NaverMapController> _controller = Completer();

class CafeScreen extends StatefulWidget {
  final String token;
  final String name;
  const CafeScreen(this.token, this.name);
  
  @override
  _CafeScreenState createState() => _CafeScreenState();
}

class _CafeScreenState extends State<CafeScreen> {
  @override
  Widget build(BuildContext context) {
    var map = NaverMap(
      mapType: MapType.Basic,
      onMapCreated: _onMapCreated,
    );
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: 44 * height / height_whole,

            ),
            Container( //사진부분
              width: width,
              height: 186 * height / height_whole,
              color : Colors.black
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
                                  image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
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
                      padding: EdgeInsets.only(left : 20 * w_percent,top : 16 * h_percent ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(widget.name, style: TextStyle(fontFamily: 'MainFont', fontSize: 18, fontWeight: FontWeight.w500, color : CafeinColors.grey800),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left : 20 * w_percent,top : 16 * h_percent ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("서울마포구어쩌고", style: TextStyle(fontFamily: 'MainFont', fontSize: 14, fontWeight: FontWeight.w400, color : CafeinColors.grey800),),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top : 46 * h_percent),
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
                                          child: Icon(Icons.power, size : 24, color :CafeinColors.orange400),
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(left : 8 * w_percent),
                                          child: Text("콘센트",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(left : 4 * w_percent),
                                          child: Text("50",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),
                                        ),
                                        Text("%이상 자리에서 사용 가능해요",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),
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
                                          child: Icon(Icons.bathroom, size : 24, color :CafeinColors.orange400),
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(left : 8 * w_percent),
                                          child: Text("화장실",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left : 4 *w_percent),
                                          child: Text("다시 가고싶지 않아요",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),
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
                                          child: Icon(Icons.table_restaurant_outlined, size : 24, color :CafeinColors.orange400),
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(left : 8 * w_percent),
                                          child: Text("테이블",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left : 4 * w_percent),
                                          child: Text("불편해요",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),
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
                                          child: Icon(Icons.wifi, size : 24, color :CafeinColors.orange400),
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(left : 8 * w_percent),
                                          child: Text("와이파이",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left : 4 * w_percent),
                                          child: Text("불편해요",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),
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
            _cafeinsPickList(h_percent, w_percent)
          ],
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
                          color : Colors.green,
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
                Text("카공 리뷰", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),

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
                        itemCount: 10,
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
      height: 373 * h_percent,
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
                    onPressed: () {},
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
                            child: Text("오후 11:10 에 영업 종료", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' , color : CafeinColors.grey800)),
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

                Container(
                  width : w_percent * width_whole - 16 * w_percent,
                  height: 214 * h_percent,
                  child: ListView.builder(itemBuilder: (BuildContext context, int index){
                    return Container();

                  }),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
  void _onMapCreated(NaverMapController controller){
    if(_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
