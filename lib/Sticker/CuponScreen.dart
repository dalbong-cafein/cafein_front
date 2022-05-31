import 'package:cafein_front/CDS/CafeinButtons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';
import 'package:http/http.dart' as http;

class CuponScreen extends StatefulWidget {
  final String token;
  const CuponScreen(this.token);


  @override
  _CuponScreenState createState() => _CuponScreenState();
}

class _CuponScreenState extends State<CuponScreen> {
  List<bool> clikced = [false, false, false, false, false, false, false];
  List<String> cuponcafes = ["스타벅스", "투썸플레이스", "탐앤탐스", "파스쿠찌", "이디야커피"];
  List<String> cuponnames = ["아이스 카페 아메리카노(T)", "아메리카노(R)", "아이스 아메리카노 T", "아이스 아메리카노(R)", "카페 아메리카노(ICE) (EXTRA)"];
  List<String> cuponimages = ["imgs/couponstarbucks.png", 'imgs/coupontwosome.png','imgs/coupontamandtoms.png','imgs/couponpars.png',  'imgs/couponediea.png'];
  List<String> logoimages = ["imgs/starbucks.png", 'imgs/twosome.png' ,"imgs/tomandtoms.png","imgs/parselogo.png", "imgs/ediyalogo.png" ];

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
      body: Padding(
        padding:EdgeInsets.only(bottom: w_percent * 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: SizedBox(
                width : width_whole * w_percent - 32,
                child: GridView.builder(

                    itemCount: 5,
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
                  if(_isPicked()){
                    _sendData(_whatIsPicked());
                  }
                },
                icon: Container(
                  color : Colors.white,
                  width :w_percent * width_whole - 32,
                  height: 52 * h_percent,
                  child: CafeinButtons.OrangeButton(52 * h_percent, w_percent * width_whole - 32, "이 쿠폰으로 받기", _isPicked()),
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


      width : 158 * w_percent,
      height: 240 * h_percent,
      child: IconButton(
        padding: EdgeInsets.zero, // 패딩 설정
        constraints: BoxConstraints(), // constraints
        onPressed: () {
          if(clikced[index]){
            clikced[index] = false;
          }
          else{
            clikced = [false, false, false, false, false, false, false];
            clikced[index] = true;

          }

          setState(() {


          });

        },
        icon: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
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
                      child: Image.asset(cuponimages[index]),
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
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(48), // Image radius
                              child: Image.asset(logoimages[index]),
                            ),
                          )

                        ),
                        Padding(
                          padding: EdgeInsets.only(left : 4 * w_percent),
                          child: Text(cuponcafes[index],  style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top : 8 * h_percent),
                  child: Padding(
                    padding: EdgeInsets.only(left : 12 * w_percent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(

                            width: 158 * w_percent - 24 * w_percent,
                            child: Text(cuponnames[index],  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800) )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  bool _isPicked(){ //쿠폰이 선택 되었는지 확인하는 함수
    for(int i = 0 ; i < cuponcafes.length; i ++){
      if(clikced[i]){
        return true;
      }
    }
    return false;
  }

  int _whatIsPicked(){ //몇번째 쿠폰이 선택되었는지
    for(int i = 0 ; i < cuponcafes.length; i ++){
      if(clikced[i]){
        return i;
      }
    }
    return 0;

  }

  Future<void> _sendData(int index) async {

    var accesstoken = widget.token;
    var map = new Map<String, dynamic>();
    map['brandName'] = cuponcafes[index];
    map['itemName'] = cuponnames[index];
    var map_json = json.encode(map);

    try{
      final response = await http.post(

          Uri.parse("https://api.cafeinofficial.com/coupons"),
          body: map_json,
          headers: {'cookie' : "accessToken=$accesstoken", "Content-Type": "application/json"}
      );

      print(response.headers);

    }catch(e){
      print(e);
    }

  }
}
