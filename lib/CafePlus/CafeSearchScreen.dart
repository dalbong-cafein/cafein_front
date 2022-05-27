import 'package:cafein_front/CDS/CafeinButtons.dart';
import 'package:cafein_front/CafePlus/CafeMapScreen.dart';
import 'package:cafein_front/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';

class CafeSearchScreen extends StatefulWidget {
  const CafeSearchScreen({Key? key}) : super(key: key);

  @override
  _CafeSearchScreenState createState() => _CafeSearchScreenState();
}

class _CafeSearchScreenState extends State<CafeSearchScreen> {

  final myController = TextEditingController();
  bool typing = false;
  List<bool> checked = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
  var data;
  var data_len = 0;
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    if(myController.text.length == 0){
      typing = false;
      myController.text = "";
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("주소 찾기",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width - 32 * w_percent,
                height: 44 * h_percent,
                child: TextField(
                  onChanged: (text) async {
                    typing = true;
                    await _loadData(text);
                    setState(() {

                    });
                  },
                  onSubmitted: (text) async {
                    typing = true;
                    await _loadData(text);
                    setState(() {

                    });
                  },
                  onEditingComplete: () async {
                    typing = true;
                    await _loadData(myController.text);
                    setState(() {

                    });
                  },
                  controller: myController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText:"도로명, 건물명, 번지 검색" ,
                    filled: true,
                    suffixIcon: typing ? IconButton(
                      padding: EdgeInsets.zero, // 패딩 설정
                      constraints: BoxConstraints(), // constraints
                      onPressed: () async {
                        myController.clear();
                        data_len = 0;
                        setState(() async {

                        });
                      },
                      icon: Icon(Icons.cancel, color : CafeinColors.grey300),
                    ) : Icon(Icons.search, color : CafeinColors.grey800),
                    fillColor: Color(0xffF6F6F6),
                    hintStyle: TextStyle(color:  Color(0xffACACAC), fontWeight: FontWeight.w500, fontFamily: 'MainFont', fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(width: 1, color: const Color(0xffF6F6F6))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(width: 1, color: const Color(0xffF6F6F6))
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              height: 800 * h_percent,
              width: width,
              child: ListView.builder(
                  itemCount: data_len,
                  itemBuilder: (BuildContext context, int index){
                return _listOne(w_percent, h_percent, index);
              }),
            )
          ),

        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color :Colors.white,
          width : width,
          height: 75 * h_percent,
          child: Padding(
            padding: EdgeInsets.only( top :2 *h_percent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width : width - 32 * w_percent,
                  height: 52 * h_percent,
                  child: IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {},
                    icon: CafeinButtons.OrangeButton(52 * h_percent, width - 32 * w_percent, "이 위치에 카공 카페 등록하기", true),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _listOne(double w_percent, double h_percent, int index){
    return Container(
      width : w_percent * width_whole,
      height: 85 * h_percent,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 84 * h_percent,
            width : w_percent * width_whole,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left : 18 * w_percent, top : 12 * h_percent),
                      child: Container(
                        height: 24 * h_percent,
                        width: 24 * h_percent,
                        child: Checkbox(
                          onChanged: (value) {
                            checked[index] = !checked[index];
                            setState(() {

                            });
                          },
                          value: checked[index],
                          overlayColor: MaterialStateProperty.all(Color(0xFF5D5F6E)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),

                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width : 246 * w_percent,
                  height: 80 * h_percent,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                        width : 246 * w_percent,
                        height: 55 * h_percent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['documents']![index]['place_name'],  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                            Text(data['documents']![index]['road_address_name'],  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
                            Row(
                              children: [
                                Container(
                                  child: Center(child: Text("지번", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) ),),
                                  width: 34 * w_percent,
                                  height: 20 * h_percent
                                  ,decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color : Color(0xffD1D1D1)
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0)
                                    ),
                                  ),

                                ),
                                Padding(
                                  padding: EdgeInsets.only(left : 4 * w_percent),
                                  child: Text(data['documents']![index]['address_name'],  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30 * h_percent,
                  width: 58 * w_percent,
                  child:
                  IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CafeMapScreen(double.parse(data['documents']![index]['y']), double.parse(data['documents']![index]['x']), data['documents']![index]['address_name'])),
                      );
                    },
                    icon:Container(
                      child: Center(child: Text("지도",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),),
                      height: 30 * h_percent,
                      width: 58 * w_percent,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color : Color(0xffD1D1D1)
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(8.0)
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
          Container( height:1 * h_percent,
            width: 328 * w_percent,
            color:Color(0xffEFEFEF),)
        ],

      ),
    );
  }
  Future<void> _loadData(String text) async {
    var dio = new Dio();

    dio.options.headers = {'Authorization' : "KakaoAK " + kakao_restapi};

    //dio.options.queryParameters = {'storeId' : 1 ,"Recommendation" : "GOOD", "content" : "123", "socket" : 1, "wifi" : 1, "restroom" : 1, "tableSize" : 1};
    var res_dio = await dio.get("https://dapi.kakao.com/v2/local/search/keyword.json?query=" + text);
    data  = await res_dio.data;
    data_len = await data['meta']['total_count'];
    print(res_dio.data.toString());


    print(data_len);

  }
}
