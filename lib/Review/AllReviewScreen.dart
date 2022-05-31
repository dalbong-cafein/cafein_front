import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';

class AllReviewScreen extends StatefulWidget {
  final String token;
  final int id;
  const AllReviewScreen(this.token , this.id);


  @override
  _AllReviewScreenState createState() => _AllReviewScreenState();
}

class _AllReviewScreenState extends State<AllReviewScreen> {

  var checked = false;

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
                onPressed: () {},
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
        child: Column(
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

            Container(
              height: 565 * h_percent,
              width: w_percent * width_whole,

              padding: EdgeInsets.zero,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context , int index){

                    return Container(color : Colors.red);
                  }),
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

      print(response.body);

    }catch(e){
      print(e);
    }

  }
}
