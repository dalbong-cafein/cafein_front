import 'package:cafein_front/CDS/CafeinButtons.dart';
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
                          physics: NeverScrollableScrollPhysics(),
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
            true ? _stickerHistory(w_percent, h_percent) : Container(
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
                          Icon(Icons.error_outline, size : 24 ,color : CafeinColors.grey600),
                          Padding(
                            padding: EdgeInsets.only(left : 4 * w_percent),
                            child: Text("확인해 주세요",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
                          )
                        ],
                      ),
                      Padding(
                        padding:EdgeInsets.only(top : 10 *h_percent),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width : 20 * w_percent,
                                    height: 20 * h_percent,
                                    child: Icon(Icons.fiber_manual_record, size : 5, color : CafeinColors.grey600)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width : 308 * w_percent,
                                  child: Text("스티커 20개를 모으면 아메리카노 1잔 무료 쿠폰을 드립니다.",
                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 20 * w_percent,
                                  height: 20 * h_percent,
                                  child: Icon(Icons.fiber_manual_record, size : 5, color : CafeinColors.grey600)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 308 * w_percent,
                                  child: Text("무료 쿠폰은 프랜차이즈 카페 다섯 곳 중 한곳을 선택할 수 있습니다.",
                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) )),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 20 * w_percent,
                                  height: 20 * h_percent,
                                  child: Icon(Icons.fiber_manual_record, size : 5, color : CafeinColors.grey600)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 308 * w_percent,
                                  child: Text("발행된 기프티콘은 현금으로 환불할 수 없습니다.",
                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) )),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 20 * w_percent,
                                  height: 20 * h_percent,
                                  child: Icon(Icons.fiber_manual_record, size : 5, color : CafeinColors.grey600)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 308 * w_percent,
                                  child: Text("스탬프 유효 기간은 적립일 기준 6개월간입니다.",
                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) )),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 20 * w_percent,
                                  height: 20 * h_percent,
                                  child: Icon(Icons.fiber_manual_record, size : 5, color : CafeinColors.grey600)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 308 * w_percent,
                                  child: Text("하루에 최대 3개까지의 스티커를 받을 수 있습니다.",

                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) )),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 20 * w_percent,
                                  height: 20 * h_percent,
                                  child: Icon(Icons.fiber_manual_record, size : 5, color : CafeinColors.grey600)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 308 * w_percent,
                                  child: Text("한 카페에서 혼잡도를 공유해서 스탬프를 발행 받았을 시, 해당 카페에서 3시간 이내 재적립이 불가능합니다.",
                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) )),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 20 * w_percent,
                                  height: 20 * h_percent,
                                  child: Icon(Icons.fiber_manual_record, size : 5, color : CafeinColors.grey600)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 308 * w_percent,
                                  child: Text("쿠폰은 신청일 이후 돌아오는 월요일에 일괄 발송합니다.",
                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) )),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 20 * w_percent,
                                  height: 20 * h_percent,
                                  child: Icon(Icons.fiber_manual_record, size : 5, color : CafeinColors.grey600)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width : 308 * w_percent,
                                  child: Text("신청한 쿠폰은 인증된 휴대폰번호로 발송됩니다.",
                                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) )),
                            ],
                          )
                        ],
                      ),



                    ],
                  ),
                ),
              ),
            )



          ],
        ),
      ),
      bottomSheet: Container(
        width : w_percent * width_whole,
        height: 75 * h_percent,
        color: Colors.white,
        child: Container(
          width : 328 * w_percent,
          height: 52 * h_percent,
          child: IconButton(
            padding: EdgeInsets.zero, // 패딩 설정
            constraints: BoxConstraints(), // constraints
            onPressed: () {},
            icon:Container(
              width : 328 * w_percent,
              height: 52 * h_percent,
              child: CafeinButtons.OrangeButton(52 * h_percent, 328 * w_percent, "쿠폰 신청하기", true),
            ),
          ),
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
  Widget _stickerHistory(double w_percent, double h_percent){
    return Padding(
      padding: EdgeInsets.only(left : 20 * w_percent, top : 24 * h_percent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

            width : 264 * w_percent,
            height: h_percent * 72 * 2,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index){
              return _stickerHistoryOne(w_percent, h_percent);
            }),
          ),
        ],
      ),
    );
  }
  
  Widget _stickerHistoryOne(double w_percent, double h_percent){
    return Container(

      width : w_percent * 264,
      height: 72 * h_percent,
      child: Column(
        children: [
          Container(
            height: 52 * h_percent,
            width : w_percent * 264,

            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 52 * w_percent,
                      height: 52 * h_percent,
                      decoration: new BoxDecoration(
                        border: Border.all(
                            width: 1 * w_percent,
                            color : CafeinColors.grey400
                        ),
                        shape: BoxShape.circle,
                      ),

                    ),
                    Container(
                      width: 52 * w_percent,
                      height: 52 * h_percent,
                      child: Center(
                        child:Text("+1", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left : 12 * w_percent),
                  child: Container(
                    width : 200 * w_percent,
                    height: 50 * h_percent,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("혼잡도 공유", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                        Text("투썸플레이스 어쩌고저쩌고", style: TextStyle(fontSize: 13,fontWeight: FontWeight.w200, fontFamily: 'MainFont', color : CafeinColors.grey400) ),
                        Text("유효기간 2022.14.16 - 2022.10.16", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600) )
                      ],
                    )

                  ),
                )
              ],
            ),

          )
        ],
      ),
    );
  }

}
