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
                height: 160 * height / height_whole,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top : 24 * height / height_whole),
                      child: Text(widget.name, style: TextStyle(fontFamily: 'MainFont', fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top : 16 * height / height_whole),
                      child: Container(
                        width: 98 * width / width_whole,
                        child: Row(
                          children: [
                            Container(
                              width: 24 * width / width_whole,
                              height: 24 * width / width_whole,
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top : 24 * height/ height_whole),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left : 35 * width / width_whole),
                            child: Container(
                              width: 69 * width/ width_whole,
                              height: 24 * height / height_whole,
                              child: IconButton(
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(), // constraints
                                onPressed: () {

                                },
                                icon: Container(

                                  child: Row(
                                    children: [
                                      Icon(Icons.favorite, size : 24),
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
                          Padding(
                            padding: EdgeInsets.only(left : 26 * width / width_whole),
                            child: Container(
                              width: 1 * width / width_whole,
                              height: 24 * height/ height_whole,
                              color: Color(0xffEFEFEF),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left : 26 * width / width_whole),
                            child: Container(
                              width: 75 * width/ width_whole,
                              height: 24 * height / height_whole,
                              child: IconButton(
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(), // constraints
                                onPressed: () {

                                },
                                icon: Container(

                                  child: Row(
                                    children: [
                                      Icon(Icons.favorite_border, size : 24),
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
                          Padding(
                            padding: EdgeInsets.only(left : 26 * width / width_whole),
                            child: Container(
                              width: 1 * width / width_whole,
                              height: 24 * height/ height_whole,
                              color: Color(0xffEFEFEF),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left : 26 * width / width_whole),
                            child: Container(
                              width: 57 * width/ width_whole,
                              height: 24 * height / height_whole,
                              child: IconButton(
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(), // constraints
                                onPressed: () {

                                },
                                icon: Container(

                                  child: Row(
                                    children: [
                                      Icon(Icons.add_road, size : 24),
                                      Padding(
                                        padding: EdgeInsets.only(left : 10 * width/ width_whole),
                                        child: Text("공유",style: TextStyle(fontFamily: 'MainFont', fontSize: 14, fontWeight: FontWeight.w600, color : Color(0xff646464)) ),
                                      )
                                    ],

                                  ),
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
            Container(
              width: width,
              height: 184* height / height_whole,

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
