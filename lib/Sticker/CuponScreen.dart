import 'package:cafein_front/CDS/CafeinButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';

class CuponScreen extends StatefulWidget {
  const CuponScreen({Key? key}) : super(key: key);

  @override
  _CuponScreenState createState() => _CuponScreenState();
}

class _CuponScreenState extends State<CuponScreen> {
  List<bool> clikced = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text("쿠폰 신청",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SizedBox(
              width : width_whole * w_percent - 32,
              child: GridView.builder(

                  itemCount: 7,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                    childAspectRatio: 158 / 240, //item 의 가로 1, 세로 2 의 비율
                    mainAxisSpacing: 12 * w_percent, //수평 Padding
                    crossAxisSpacing: 12 * h_percent, //수직 Padding


                  ),

                  itemBuilder: (BuildContext context, int index){
                    return _gridOne(w_percent, h_percent, index);
                  }

              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        height:  75 * h_percent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width :w_percent * width_whole - 32,
              height: 52 * h_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {

                },
                icon: Container(
                  color : Colors.white,
                  width :w_percent * width_whole - 32,
                  height: 52 * h_percent,
                  child: CafeinButtons.OrangeButton(52 * h_percent, w_percent * width_whole - 32, "이 쿠폰으로 받기", true),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _gridOne(double w_percent, double h_percent, int index){
    return Container(
      color : Colors.white,
      width : 158 * w_percent,
      height: 240 * h_percent,
      child: IconButton(
        padding: EdgeInsets.zero, // 패딩 설정
        constraints: BoxConstraints(), // constraints
        onPressed: () {
          clikced = [false, false, false, false, false, false, false];
          clikced[index] = true;
          setState(() {


          });

        },
        icon: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color : clikced[index] ?CafeinColors.orange500:Colors.transparent
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(8.0)
            ),
          ),

          width : 158 * w_percent,
          height: 240 * h_percent,
          child: Padding(
            padding: EdgeInsets.only(top : 12  * h_percent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(

                  width: 134 * w_percent,
                  height: 134 * h_percent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8), // Image border
                    child: SizedBox.fromSize(
                       // Image radius
                      child: Image.network('https://picsum.photos/250?image=11', fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top : 8 * h_percent),
                  child: Container(
                    width: 134 * w_percent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width : 18 * w_percent,
                          height: 18 * h_percent,
                          child: CircleAvatar(
                            radius: 48, // Image radius
                            backgroundImage: NetworkImage('https://picsum.photos/250?image=11'),
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.only(left : 4 * w_percent),
                          child: Text('스타벅스',  style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top : 8 * h_percent),
                  child: Text("아이스 카페 아메리카노 T",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
