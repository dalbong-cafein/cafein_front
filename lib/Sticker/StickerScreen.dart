import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';

class StickerScreen extends StatefulWidget {
  const StickerScreen({Key? key}) : super(key: key);

  @override
  _StickerScreenState createState() => _StickerScreenState();
}

class _StickerScreenState extends State<StickerScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    return Scaffold(
      appBar: AppBar(
        title: Text("스티커",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:EdgeInsets.only(top : 16 * h_percent),
                  child: Container(
                    width: w_percent * width_whole - 32 * w_percent,
                    height: 48 * h_percent,
                    decoration: BoxDecoration(
                      color : CafeinColors.grey200,
                      borderRadius: BorderRadius.all(
                          Radius.circular(12.0)
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:EdgeInsets.only(left : 12 * w_percent),
                          child: Container(
                            height: 26 * h_percent,
                            width: 43 * w_percent,
                            child: Image.asset("imgs/stickerimg.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left : 10 * w_percent),
                          child: Text("스티커 받는 방법을 확인해 보세요" , style: TextStyle(fontSize: 14, fontWeight:FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey700 )),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top : 24 * h_percent, left : 20 * w_percent),
              child: Row(
                children: [
                  Text("내가 모은 스티커", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                  Text(" 0", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.orange500) ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top : 24 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      width : width_whole * w_percent - 64,
                      height: 270 *h_percent,

                      child: GridView.builder(

                          itemCount: 20,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, //1 개의 행에 보여줄 item 개수
                            childAspectRatio: 62 / 38, //item 의 가로 1, 세로 2 의 비율
                            mainAxisSpacing: 12 * w_percent, //수평 Padding
                            crossAxisSpacing: 12 * h_percent, //수직 Padding


                          ),

                          itemBuilder: (BuildContext context, int index){
                            return true? _numberSticker(index+1) : Container(child: Image.asset("imgs/stickerimg.png"));
                          }

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top : 28 * h_percent),
              child: Container( height:1.0,
                width: 328 * w_percent,
                color:Color(0xffEFEFEF),),
            ),
            Padding(
              padding: EdgeInsets.only(top : 20 * h_percent),
              child: Row(
                children: [
                  Container(
                    width: w_percent * width_whole * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:EdgeInsets.only( left : 20 * w_percent),
                          child: Text("스티커 히스토리",  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800)
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: w_percent * width_whole * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:EdgeInsets.only(right : 20 * w_percent),
                          child: Container(
                            width : 58 * w_percent,
                            height: 16 * h_percent,
                            child:
                            IconButton(
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(), // constraints
                              onPressed: () {},
                              icon: Container(
                                width : 58 * w_percent,
                                height: 16 * h_percent,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.swap_vert, color : CafeinColors.grey400, size : 20),
                                    Padding(
                                      padding:EdgeInsets.only(left : 4 * w_percent),
                                      child: Text("최근 순",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600)
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
              height: 188 * h_percent,
              width: w_percent * width_whole,
              child: Center(
                child: Container(
                  width : 248 * w_percent,
                  height: 92 * h_percent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width : 49 * w_percent,
                          height: 42 * h_percent,
                          child: Image.asset("imgs/nocafeimg.png")),
                      Padding(
                        padding: EdgeInsets.only(top : 10 * h_percent),
                        child: Text("모은 스티커가 없어요",  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
                      ),
                      Text("스티커 20개를 모으면 아메리카노 쿠폰을 드려요",  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) )

                    ],
                  ),
                ),
              ),
            ),
            Container(
              width : w_percent * width_whole,
              height: 300 *h_percent,
              color : Color(0xffF6F6F6),
              child: Center(
                child: Container(
                  width: 328 * w_percent,
                  height: 252 * h_percent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.error_outline),
                          Text("확인해 주세요")
                        ],
                      )
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
  Widget _numberSticker(int index){
    return Stack(
      children: [
        Image.asset("imgs/emptysticker.png"),
        Center(child: Text(index.toString(), style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey400) ),)
      ],
    );
  }
}
