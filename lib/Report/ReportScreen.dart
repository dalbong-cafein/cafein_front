import 'package:cafein_front/CDS/CafeinButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';

class ReportScreen extends StatefulWidget {
  final String token;
  const ReportScreen(this.token);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  var checklist = [false, false, false, false, false, false, false];
  var reports = ["카페와 관련 없는 내용", "음란성, 욕설 등 부적절한 내용", "부적절한 홍보 또는 광고", "개인정보 유출 위험", "리뷰 작성 취지에 맞지 않는 내용(복사글 등)", "저작권 도용 의심", "기타"];
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    return Scaffold(
      resizeToAvoidBottomInset : true,
      appBar: AppBar(

        backgroundColor: Color(0xffFFFFFF),

        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:EdgeInsets.only( left : 24 * w_percent),
              child: Text("신고하는 이유를 알려주세요", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
            ),
            Padding(
              padding:EdgeInsets.only( left : 24 * w_percent, top : 12 * h_percent),
              child: Text("신고 이유가 타당하지 않으면 반영되지 않을 수 있습니다.", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
            ),


            Padding(
              padding: EdgeInsets.only(top : 24 * h_percent),
              child: _reportListOne(0, w_percent, h_percent),
            ),
            _reportListOne(1, w_percent, h_percent),
            _reportListOne(2, w_percent, h_percent),
            _reportListOne(3, w_percent, h_percent),
            _reportListOne(4, w_percent, h_percent),
            _reportListOne(5, w_percent, h_percent),
            _reportListOne(6, w_percent, h_percent),
            checklist[6] ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 312 * w_percent,
                  height: 80 * h_percent,
                  child: TextField(
                    onSubmitted: (text){

                    },
                    scrollPadding: EdgeInsets.only(bottom:  height * 0.2),
                    keyboardType: TextInputType.multiline,
                    minLines: 5,
                    maxLines: null,
                    maxLength: 100,
                    cursorColor: CafeinColors.orange400,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),

                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color : Color(0xffACACAC))
                      ),

                      hintText: "신고 이유를 작성해 주세요",
                      hintMaxLines: 2,
                      contentPadding: EdgeInsets.all(12 * w_percent),
                      hintStyle: TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w400, color : Color(0xffACACAC) ),
                    ),
                  ),
                ),
              ],
            ): Container(),
            Container(
              height:  height * 0.2,
            )

          ],
        ),
      ),
      bottomSheet: Container(
        color : Colors.white,
        width : width,
        height: 100 * h_percent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 52 * h_percent,
              width: 328 * w_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {},
                icon: Container(
                  height: 52 * h_percent,
                  width: 328 * w_percent,
                  child: CafeinButtons.OrangeButton(52 * h_percent, 328 * w_percent, "신고하기", true),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
  Widget _reportListOne(int index, double w_percent, double h_percent){
    return Container(
      height: 56 * h_percent,
      width : 368 * w_percent,
      child: IconButton(
        padding: EdgeInsets.zero, // 패딩 설정
        constraints: BoxConstraints(),

        onPressed: (){
          checklist = [false, false, false, false, false, false, false];
          checklist[index]  = !checklist[index];
          setState(() {
          });

        },
        icon: Container(
          height: 56 * h_percent,
          width : 368 * w_percent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width : 0.8 * w_percent * width_whole,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:EdgeInsets.only(left : 24 * w_percent),
                      child: Text(reports[index],  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : checklist[index] ?CafeinColors.orange500 : CafeinColors.grey800) ),
                    )
                  ],
                ),
              ),
              Container(
                width : 0.2 * w_percent * width_whole,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right : 16 * w_percent),
                      child: Container(
                        width : 24 * w_percent,
                        height: 24 * h_percent,
                        child : Icon(Icons.check, color : checklist[index] ?CafeinColors.orange500:CafeinColors.grey300, size : 24)
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

