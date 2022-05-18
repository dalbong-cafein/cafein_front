import 'package:cafein_front/CDS/CafeinColors.dart';
import 'package:cafein_front/Main/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                                        Text("콘센트"),
                                        Text("50"),
                                        Text("%이상 자리에서 사용 가능해요"),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 50 * w_percent,
                                    height: 48 * h_percent,
                                    color:Colors.green,
                                    child: Row(
                                      children: [

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
                  )
                ],
              ),
            ),
            Container(
              width: width,
              height: 10 * height / height_whole,
              color: Color(0xffF6F6F6),
            ),
          ],
        ),

      ),
    );
  }
}
