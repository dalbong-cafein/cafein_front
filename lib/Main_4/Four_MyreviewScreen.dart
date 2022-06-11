import 'dart:convert';

import 'package:cafein_front/CDS/CafeinColors.dart';
import 'package:cafein_front/Main/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../CDS/CafeinErrorDialog.dart';

class Four_MyreviewScreen extends StatefulWidget {
  final String token;
  const Four_MyreviewScreen(this.token);

  @override
  _Four_MyreviewScreenState createState() => _Four_MyreviewScreenState();
}

class _Four_MyreviewScreenState extends State<Four_MyreviewScreen> {


  List<bool> open = [false, false, false, false, false, false, false];

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _loadReview());

  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    return Scaffold(
      appBar: AppBar(backgroundColor : Colors.white,
        titleTextStyle: TextStyle(color : Colors.black, fontSize: 16, fontFamily: 'MainFont', fontWeight: FontWeight.w500),
        title: FutureBuilder(
        builder: (BuildContext context , AsyncSnapshot snapshot) {
          if(snapshot.hasData == false){
            return SizedBox(
              height: 1 * h_percent,
              width : 1 * w_percent,
              child: Padding(
                padding: EdgeInsets.only(bottom: 400 * h_percent),
                child: Center(
                  child: CircularProgressIndicator(

                    valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),
                  ),
                ),
              ),
            );
          }else{
            return Text("내가 쓴 리뷰",);
          }

        }
      ),
        centerTitle: true,
        iconTheme:  IconThemeData(
          color: Color(0xff333333),
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color : Color(0xff333333)),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: ListView.builder(
              itemCount: 7,
              itemBuilder: (BuildContext listcontext, int index){

            return _reviewListOne(index, h_percent, w_percent);
          }),
        ),
      ),
    );;
  }

  Widget _reviewListOne(int index, double h_percent, double w_percent){
    return Padding(
      padding: EdgeInsets.only(top : 16 * h_percent),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(width : w_percent * width_whole,
                  height: 32 * h_percent,
                    child:Padding(
                      padding: EdgeInsets.only( left : 16 * w_percent),
                      child: Row(
                        children: [
                          Container(
                            width : 32 * w_percent,
                            height: 32 * h_percent,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(32 * w_percent), // Image radius
                                child: Image.network('https://picsum.photos/250?image=11', fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left :8 * w_percent),
                            child: Container(
                              width: 200 * w_percent,
                              height: 32 * h_percent,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("투썸플레이스 합정역점",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),
                                  Padding(
                                    padding: EdgeInsets.only(top : 2 * h_percent),
                                    child: Text("2022.03.25 , 3 번째 방문",  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'MainFont' , color :CafeinColors.grey400)),
                                  ),

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
            Padding(
              padding:EdgeInsets.only(top : 12 * h_percent, left : 16 * w_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _recommend("GOOD", index, w_percent, h_percent),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top : 16 * h_percent),
              child: Container( height:1.0 * h_percent,
                width: 328 * w_percent,
                color:Color(0xffEFEFEF),),
            )
          ],
        ),
      ),
    );
  }

  Widget _recommend(String str, int index, double w_percent, double h_percent){
    var color;
    var text_color;
    var text;
    if(str == "GOOD"){
      color =Color(0xffFFF0E6);
      text_color = CafeinColors.orange500;
      text = "추천해요";
    }if(str == "NORMAL"){
      color = Color(0xffFFF3E0);
      text_color = Color(0xffFF9800);
      text = "그냥그래요";
    }if(str == "BAD"){
      color = CafeinColors.grey100;
      text_color = CafeinColors.grey600;
      text = "별로에요";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 75 *w_percent,
          height: 22 * h_percent,
          decoration: BoxDecoration(

            color : color,
            borderRadius: BorderRadius.all(
                Radius.circular(20.0)
            ),
          ),
          child: Center(

            child : Container(
              width : 59 * w_percent,
              height: 14 * h_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {
                  open[index] = !open[index];
                  setState(() {

                  });
                },
                icon: Container(
                  width : 59 * w_percent,
                  height: 14 * h_percent,
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(text, style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : text_color)
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded, size : 20, color : text_color)

                    ],
                  ),
                ),
              ),
            ),

          ),
        ),
        open[index] ? Padding(
          padding:EdgeInsets.only(left : 8 * w_percent, top : 14 * h_percent),
          child: Container(
            width : 202 * w_percent,
            height: 34 * h_percent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 98 * w_percent,
                  height: 34 * h_percent,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                        width: 95 * w_percent,
                        height: 12 * h_percent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("와이파이", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                            _stars(3 ,w_percent, h_percent)
                          ],
                        ),
                      ),
                      Container(
                        width: 95 * w_percent,
                        height: 12 * h_percent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("화장실", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                            _stars(3 ,w_percent, h_percent)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 98 * w_percent,
                    height: 34 * h_percent,


                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 95 * w_percent,
                        height: 12 * h_percent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("콘센트", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                            _stars(3 ,w_percent, h_percent)
                          ],
                        ),
                      ),
                      Container(
                        width: 95 * w_percent,
                        height: 12 * h_percent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("테이블", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                            _stars(3 ,w_percent, h_percent)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ) : Container()
      ],
    );
  }
  Widget _stars(int stars, double w_percent, double h_percent){ //별점 widget
    return Container(

      width: 56 * w_percent,
      height: 12 * h_percent,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Icon(Icons.star_rounded, size : 14 ,color : stars >= 1 ?CafeinColors.orange400 : CafeinColors.grey200),
          Icon(Icons.star_rounded, size : 14, color : stars >= 2 ?CafeinColors.orange400 : CafeinColors.grey200),
          Icon(Icons.star_rounded, size : 14, color : stars >= 3 ?CafeinColors.orange400 : CafeinColors.grey200),
          Icon(Icons.star_rounded, size : 14, color : stars >= 4 ?CafeinColors.orange400 : CafeinColors.grey200),

        ],
      ),
    );
  }

  Future<void> _loadReview() async {

    var accesstoken = widget.token;





    final response = await http.get(

        Uri.parse("https://api.cafeinofficial.com/members/reviews"),

        headers: {'cookie' : "accessToken=$accesstoken", "Content-Type": "application/json"}
    );

    if( response.statusCode == 400 || response.statusCode == 401 || response.statusCode == 403 || response.statusCode == 500){
      CafeinErrorDialog.showdialog(w_percent_m, h_percent_m, context);
    }

    Map<String , dynamic> message = jsonDecode(utf8.decode(response.bodyBytes));
    print(message);
  }
}
