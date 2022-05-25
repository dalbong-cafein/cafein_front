import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';
final myController = TextEditingController();
final myController_wifi = TextEditingController();
class CafeplusScreen extends StatefulWidget {
  const CafeplusScreen({Key? key}) : super(key: key);

  @override
  _CafeplusScreenState createState() => _CafeplusScreenState();
}

class _CafeplusScreenState extends State<CafeplusScreen> {
  bool textin = false;
  bool feeling_good = false;
  bool feeling_soso = false;
  bool feeling_bad = false;
  int rating_0 = 0;
  int rating_1 = 0;
  int rating_2 = 0;
  int rating_3 = 0;
  bool timeadd = false;
  String daytime = " ";
  int hour = 0;
  String minute = " ";
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
            )
          ],

        ),


      ),

    );
  }
  Widget _times(double w_percent, double h_percent, double width){
    return Container(

      width: width - (w_percent * 32),
      height: 152 * h_percent,
      child: Column(

        children: [
          Container(
            height: 44 * h_percent,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 44 * h_percent,
                  width: 113 * w_percent
                  ,child: IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {

                      showModalBottomSheet(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),

                      ),context: context, builder: (BuildContext timesheetcontext){

                        return _timeSheet(w_percent, h_percent, timesheetcontext);
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
                        width: 113 * w_percent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("시작 시간",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
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
                    width: 113 * w_percent
                    ,child: IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: CafeinColors.grey400,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      height: 44 * h_percent,
                      width: 113 * w_percent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("종료 시간",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
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
                    width: 83 * w_percent
                    ,child: IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: CafeinColors.grey400,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      height: 44 * h_percent,
                      width: 83 * w_percent,
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
          )
        ],
      ),
    );
  }

  Widget _timeSheet(double w_percent, double h_percent, BuildContext timesheetcontext){
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
                    onValueChanged: (s) => print(s),
                    datas: ["오전", "오후"],
                    unSelectTextStyle: TextStyle(color : CafeinColors.grey600, fontSize: 20 , fontWeight: FontWeight.w400, fontFamily: 'MainFont'),
                      selectTextStyle:TextStyle(color : CafeinColors.grey800, fontSize: 20 , fontWeight: FontWeight.w400, fontFamily: 'MainFont')
                  ),
                ),
                Container(
                  width : 50 * w_percent,
                  child: WheelChooser.integer(
                    onValueChanged: (s) => print(s),
                    maxValue: 12,
                    minValue: 1,
                    initValue: 5,

                    unSelectTextStyle: TextStyle(color : CafeinColors.grey600, fontSize: 20 , fontWeight: FontWeight.w400, fontFamily: 'MainFont', ),
                    selectTextStyle:TextStyle(color : CafeinColors.grey800, fontSize: 20 , fontWeight: FontWeight.w400, fontFamily: 'MainFont') ,
                  ),
                ),
                Container(
                  width : 50 * w_percent,
                  child: WheelChooser(
                    onValueChanged: (s) => print(s),
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
