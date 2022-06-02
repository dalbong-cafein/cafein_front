import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CDS/CafeinColors.dart';
import '../CDS/CafeinStoreStatus.dart';
import '../Main/MainScreen.dart';
import 'package:http/http.dart' as http;

class Four_MycafeScreen extends StatefulWidget {
  final String token;
  const Four_MycafeScreen(this.token);

  @override
  _Four_MycafeScreenState createState() => _Four_MycafeScreenState();
}

class _Four_MycafeScreenState extends State<Four_MycafeScreen> {
  var cafesdata;

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
      appBar: AppBar(backgroundColor : Colors.white,title:

      FutureBuilder(
        future: _fetch1(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData == false){
            return Container();
          }else{
            return Text("내가 등록한 카페 " + cafesdata.length.toString(), style: TextStyle(color :CafeinColors.grey800, fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w500),);

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
      body: SizedBox(
          width: width_whole * w_percent,
          height:97 * h_percent * 7,
          child: FutureBuilder(
            future: _fetch1(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData == false){
                return SizedBox(
                  height: 50 * h_percent,
                  width : 50 * h_percent,
                  child: Center(
                    child: CircularProgressIndicator(

                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  ),
                );
              }else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }else{
                return ListView.builder(

                    padding: EdgeInsets.zero,

                    itemCount:cafesdata.length,
                    itemBuilder: (BuildContext context , int index){
                      return _myCafeListOne(w_percent, h_percent, index);
                    }
                );
              }
            },
          )
      ),
    );
  }
  Widget _myCafeListOne(double w_percent, double h_percent, int index){
    return Container( //TODO index 에 마지막 원소 값  +1넣기
      width: w_percent * width_whole,
      height: 77 * h_percent,

      child: Column(
        children: [
          Container(
            height: 76 * h_percent,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 64 * h_percent,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left : 16 * w_percent),
                        child: Container(
                          height: 64 * h_percent,
                          width: 64 * h_percent,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(48), // Image radius
                              child: Image.network(cafesdata[index]['storeImageDto'] == null ?'https://picsum.photos/250?image=11':cafesdata[index]['storeImageDto']['imageUrl'], fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:EdgeInsets.only(left : 12 * w_percent),
                            child: Container(
                              height: 60 * h_percent,
                              width : 200 * w_percent,


                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cafesdata[index]['storeName'], style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                                  CafeinStoreStatus.plusOpenStatus(w_percent, w_percent, true,0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      Text("작성일 " + cafesdata[index]['regDateTime'].substring(0, 10), style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(

                        height: 76 * h_percent,
                        width : 70 * w_percent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:EdgeInsets.only(right : 16 * w_percent),
                              child: Container(
                                width: w_percent * 77,
                                height: h_percent * 30,
                                child: IconButton(
                                  padding: EdgeInsets.zero, // 패딩 설정
                                  constraints: BoxConstraints(), // constraints
                                  onPressed: () {},
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color : Color(0xffD1D1D1)
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)
                                      ),
                                    ),
                                    width: w_percent * 77,
                                    height: h_percent * 30,
                                    child: Center(
                                      child: Text("정보 수정", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
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
              ],
            ),
          ),
          Container( height:1.0,
            width: 360 * w_percent,
            color:Color(0xffEFEFEF),)
        ],
      ),
    );
  }

  void _loadData() async{
    var accesstoken = widget.token;

    try{
      final response = await http.get(

          Uri.parse("https://api.cafeinofficial.com/stores/my-registered"),

          headers: {'cookie' : "accessToken=$accesstoken"}
      );
      Map<String , dynamic> message = jsonDecode(utf8.decode(response.bodyBytes));
      print(message['data'].toString() + "결과");
      cafesdata = message['data']['resDtoList'];

      print(cafesdata);

    }catch(e){
      print(e);
    }


  }

  Future<String> _fetch1() async {
    await Future.delayed(Duration(milliseconds: 500));
    return 'Call Data';
  }
}
