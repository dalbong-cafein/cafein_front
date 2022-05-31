import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';
import 'ReviewScreen2.dart';

class AllReviewScreen extends StatefulWidget {
  final String token;
  final int id;
  const AllReviewScreen(this.token , this.id);


  @override
  _AllReviewScreenState createState() => _AllReviewScreenState();
}

class _AllReviewScreenState extends State<AllReviewScreen> {

  var checked = false;
  var reviewdata ;

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _loadData());

  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    return Scaffold(
      appBar : AppBar(
        title: Text("리뷰 15",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right:  16 *w_percent),
            child: Container(
              width : 75 * w_percent,
              height: 16 * h_percent,
              child: IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReviewScreen2(widget.token, widget.id)),
                  );
                },
                icon: Container(
                  width : 75 * w_percent,
                  height: 16 * h_percent,

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, size : 16 , color : CafeinColors.orange500),
                      Padding(
                        padding: EdgeInsets.only(left : 6 * w_percent),
                        child: Text("리뷰 쓰기", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.orange500
                        ) ),
                      )
                    ],

                  ),
                ),
              ),
            ),
          )
        ],
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _fetch1(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if(snapshot.hasData == false){
              return SizedBox(
                height: 50 * h_percent,
                width : 50 * h_percent,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 400 * h_percent),
                  child: Center(
                    child: CircularProgressIndicator(

                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  ),
                ),
              );
            }else{
            return Column(
              children: [
                Container( height:1.0,
                  width: w_percent * width_whole,
                  color:Color(0xffEFEFEF),),
                Container(
                  height: 42 * h_percent,
                  width : w_percent * width_whole,
                  child: Row(
                    children: [
                      Container(
                        width : w_percent * width_whole * 0.5,
                        height: 42 * h_percent,

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left : 16 * w_percent),
                              child: Container(
                                height:  24 * h_percent,
                                width: 24 * w_percent
                                ,child: Checkbox(

                                    value: checked, onChanged: (check){
                                      checked = !checked;
                                      setState(() {


                                      });
                                }),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left : 6 * w_percent),
                              child: Text("사진 리뷰만"),
                            )
                          ],
                        ),
                      ),
                      Container(
                          width : w_percent * width_whole * 0.5,
                        height: 42 * h_percent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 16 * w_percent),
                              child: Container(
                                width : 46 * w_percent,
                                height: 14 * h_percent,
                                child : IconButton(
                                  padding: EdgeInsets.zero, // 패딩 설정
                                  constraints: BoxConstraints(), // constraints
                                  onPressed: () {},
                                  icon: Container(
                                    width : 46 * w_percent,
                                    height: 14 * h_percent,
                                    child: Row(
                                      children: [
                                        Icon(Icons.fiber_manual_record, size : 7),
                                        Padding(
                                          padding:EdgeInsets.only( left : 6 * w_percent),
                                          child: Text("최신순"),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 16 * w_percent),
                              child: Container(
                                width : 57 * w_percent,
                                height: 14 * h_percent,
                                child : IconButton(
                                  padding: EdgeInsets.zero, // 패딩 설정
                                  constraints: BoxConstraints(), // constraints
                                  onPressed: () {},
                                  icon: Container(
                                    width : 57* w_percent,
                                    height: 14 * h_percent,
                                    child: Row(
                                      children: [
                                        Icon(Icons.fiber_manual_record, size: 7,),
                                        Padding(
                                          padding: EdgeInsets.only(left : 6 * w_percent),
                                          child: Text("오래된순"),
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
                Container( height:1.0,
                  width: w_percent * width_whole,
                  color:Color(0xffEFEFEF),),

                Padding(
                  padding: EdgeInsets.only(top : 16 * h_percent),
                  child: Container(
                    height: 1000 * h_percent,
                    width: w_percent * width_whole,

                    padding: EdgeInsets.zero,
                    child: FutureBuilder(
                      future: _fetch1(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData == false){
                          return SizedBox(
                            height: 50 * h_percent,
                            width : 50 * h_percent,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 400 * h_percent),
                              child: Center(
                                child: CircularProgressIndicator(

                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                                ),
                              ),
                            ),
                          );
                        }else{
                          return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: reviewdata.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context , int index){

                                return _reviewListOne(h_percent, w_percent, index);
                              });
                        }
                      }
                    ),
                  ),
                ),
              ],
            );}
          }
        ),
      ),
    );
  }
  Future<String> _fetch1() async {
    await Future.delayed(Duration(milliseconds: 500));
    return 'Call Data';
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
                      child: Image.network(reviewdata[index]['profileImageUrl'], fit: BoxFit.cover),
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
                        Text(reviewdata[index]['nicknameOfWriter'],  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' )),
                        Padding(
                          padding: EdgeInsets.only(top : 2 * h_percent),
                          child: Text(reviewdata[index]['regDateTime'].substring(0, 10) +"·"+reviewdata[index]['visitCnt'].toString() +"번째 방문",  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'MainFont' , color :CafeinColors.grey400)),
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
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index){
                          return Container();

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
                child: Text(reviewdata[index]['content']== null ? " " :reviewdata[index]['content'] ,maxLines: 2, style: TextStyle(height: 1.5, fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' , color :Color(0xff646464))),
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

  Future<void> _loadData() async {

    var accesstoken = widget.token;

    try{
      final response = await http.get(

          Uri.parse("https://api.cafeinofficial.com/stores/"+ widget.id.toString()+"/reviews"),

          headers: {'cookie' : "accessToken=$accesstoken"}
      );
      Map<String , dynamic> message = jsonDecode(utf8.decode(response.bodyBytes));
      print(message['data'].toString() + "결과");
      reviewdata = message['data']['dtoList']['dtoList'];

      print(reviewdata);

    }catch(e){
      print(e);
    }

  }
}
