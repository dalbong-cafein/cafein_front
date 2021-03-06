import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/search.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';
import '../Report/ReportScreen.dart';
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
  int neworold = 0;

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
        title: FutureBuilder(
          future: _fetch1()
          ,builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData == false){
            return SizedBox(
              height: 50 * h_percent,
              width : 50 * h_percent,
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

            return Text("리뷰 " + reviewdata.length.toString(),  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) );
          }

          }
        ),
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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top : 44 * h_percent),
            child: SingleChildScrollView(
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


                      Container(
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
                                    //리뷰에 사진이랑 내용 다 없을 경우는 제외시킨다.
                                    return reviewdata[index]['content'] == null && reviewdata[index]['reviewImageDtoList'].length == 0 ? Container() :_reviewListOne(h_percent, w_percent, index);
                                  });
                            }
                          }
                        ),
                      ),
                    ],
                  );}
                }
              ),
            ),
          ),
          Container(
            height:  44 * h_percent,
            child: Column(
              children: [
                Container( height:1 * h_percent,
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

                                if(checked){
                                  for(int i = 0 ; i < reviewdata.length ; i++){
                                    if(reviewdata[i]['reviewImageDtoList'].length == 0){
                                      reviewdata.removeAt(i);
                                    }
                                  }

                                }
                                if(!checked){
                                  _loadData();
                                  neworold = 0;
                                }
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
                                  onPressed: () {
                                    if(neworold == 1){
                                      reviewdata = List.from(reviewdata.reversed);
                                    }

                                    neworold = 0;
                                    setState(() {

                                    });
                                  },
                                  icon: Container(
                                    width : 46 * w_percent,
                                    height: 14 * h_percent,
                                    child: Row(
                                      children: [
                                        Icon(Icons.fiber_manual_record, size : 7, color :neworold ==0 ?Color(0xffFC6406):CafeinColors.grey400),
                                        Padding(
                                          padding:EdgeInsets.only( left : 6 * w_percent),
                                          child: Text("최신순", style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : neworold == 0? CafeinColors.grey600 : CafeinColors.grey400) ),
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
                                  onPressed: () {
                                    neworold = 1;
                                    reviewdata = List.from(reviewdata.reversed);
                                    setState(() {


                                    });
                                  },
                                  icon: Container(
                                    width : 57* w_percent,
                                    height: 14 * h_percent,
                                    child: Row(
                                      children: [
                                        Icon(Icons.fiber_manual_record, size: 7, color :neworold ==1 ?Color(0xffFC6406):CafeinColors.grey400 ),
                                        Padding(
                                          padding: EdgeInsets.only(left : 6 * w_percent),
                                          child: Text("오래된순", style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color :neworold == 1? CafeinColors.grey600 : CafeinColors.grey400) ),
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
                Container( height:1 * h_percent,
                  width: w_percent * width_whole,
                  color:Color(0xffEFEFEF),),
              ],
            ),
          )
        ],
      ),
    );
  }
  Future<String> _fetch1() async {
    await Future.delayed(Duration(milliseconds: 500));
    return 'Call Data';
  }
  
  double _imageorContentorBoth(double w_percent, double h_percent, int index){
    if(reviewdata[index]['reviewImageDtoList'].length == 0){
      return 110  * h_percent;
    }else if(reviewdata[index]['content']== null || reviewdata[index]['content']== ""){
      return 160  * h_percent;
    }
    return 193 * h_percent;
  }

  Widget _reviewListOne(double h_percent, double w_percent, int index){
    return Container(
      width : w_percent * width_whole,

      child: Padding(
        padding:EdgeInsets.only(left : 16 * w_percent,),
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.only(top : 16 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width : (w_percent * width_whole - 16 * w_percent) * 0.8,

                    child: Row(
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
                  ),
                  Container(
                    height: 36 * h_percent,
                      width : (w_percent * width_whole - 16 * w_percent) * 0.2,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right : 16 * w_percent),
                          child: Container(
                            height: 24 * h_percent,
                            width: 24 * w_percent,
                            child: IconButton(
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(), // constraints
                              onPressed: () {
                                showModalBottomSheet(shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),

                                ),context: context, builder: (BuildContext bottomsheetcontext){

                                  return Container(
                                    width : w_percent * width_whole,
                                    height:  h_percent * 96,

                                    decoration: BoxDecoration(
                                        color : Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),

                                        )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(

                                            height:  h_percent * 90,
                                            width : w_percent * width_whole,
                                            child: Padding(
                                              padding: EdgeInsets.only(left : 24 * w_percent),
                                              child: Container(
                                                height:  h_percent * 90,
                                                width : w_percent * width_whole,
                                                child: IconButton(

                                                  padding: EdgeInsets.zero, // 패딩 설정
                                                  constraints: BoxConstraints(), // constraints
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) =>ReportScreen(widget.token, reviewdata[index]['reviewId'])),
                                                    );
                                                  },
                                                  icon: Container(
                                                    height:  h_percent * 90,
                                                    width : w_percent * width_whole,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text("신고하기", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                              ),
                                            ))
                                      ],
                                    ),
                                  );

                                });

                              },
                              icon: Icon(Icons.more_vert_rounded, size : 24, color : CafeinColors.grey400),
                            ),


                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            reviewdata[index]['reviewImageDtoList'].length == 0 ? Container() :Padding(
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
                        itemCount: reviewdata[index]['reviewImageDtoList'].length,
                        itemBuilder: (BuildContext context, int down_index){
                          return _imageListOne(h_percent, w_percent, index, down_index);

                        }),
                  ),
                ],
              ),
            ),
            reviewdata[index]['content']== null || reviewdata[index]['content']== ""?  Container(
            ) : Padding(
              padding: EdgeInsets.only(top: h_percent * 10),
              child: Container(

                width : w_percent * 328,
                child: Text(reviewdata[index]['content']== null ? " " :reviewdata[index]['content'] , style: TextStyle(height: 1.5, fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont' , color :Color(0xff646464))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top : 10 * h_percent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container( height:1 * h_percent,
                    width: w_percent * width_whole - 32 * w_percent,
                    color:Color(0xffEFEFEF),),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget _imageListOne(double h_percent, double w_percent, int index, int down_index){
    return Container(
      width: w_percent * 78,
      height: w_percent * 72,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: w_percent * 72,
            height: w_percent * 72,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child: Image.network(reviewdata[index]['reviewImageDtoList'][down_index]['imageUrl'], fit: BoxFit.cover),
              ),
            )
            ,
          )
        ],
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
