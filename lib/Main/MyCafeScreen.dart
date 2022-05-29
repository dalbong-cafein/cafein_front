import 'package:cafein_front/CDS/CafeinStoreStatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CDS/CafeinColors.dart';
import 'MainScreen.dart';

class MyCafeScreen extends StatefulWidget {
  final String token;
  const MyCafeScreen(this.token);

  @override
  _MyCafeSreenState createState() => _MyCafeSreenState();
}

class _MyCafeSreenState extends State<MyCafeScreen> {

  int order = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    return Scaffold(
      appBar:  AppBar(
        title: Text("의 카페",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
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
        child: Column(
          children: [
            Container(
              width : w_percent * width_whole,
              height: 2*h_percent * height_whole,

              child: _cafeList(h_percent, w_percent)

            ),

          ],
        ),
      ),
    );
  }
  Widget _cafeList(double h_percent, double w_percent){
    String text = "가까운 순";
    if(order == 0){
      text = "가까운 순";
    }if(order == 1){
      text = "혼잡도낮은순";
    }if(order == 2){
      text = "추천순";
    }
    return Column(
      children: [
        Container( height:1.0 * h_percent,
          width:width_whole * w_percent,
          color:Color(0xffEFEFEF),),
        Container(

          width : w_percent * width_whole,
          height: 42 * h_percent,
          child: Row(


            children: [
              Container(

                width : w_percent * width_whole * 0.72,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    Padding(
                      padding: EdgeInsets.only(left :16 * w_percent),
                      child: Container(child: Text("총 12개", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, fontFamily: 'MainFont', color: CafeinColors.grey600),)),
                    ),
                  ],
                ),
              ),

              Container(

                width: w_percent * width_whole  * 0.28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 4 * w_percent),
                      child: Text(text, style: TextStyle(color : Color(0xffACACAC), fontSize: 13, fontWeight: FontWeight.w500, fontFamily: 'MainFont')),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 6  * w_percent),
                      child: IconButton(
                          padding: EdgeInsets.zero, // 패딩 설정
                          constraints: BoxConstraints(), // constraints
                          onPressed: (){
                            //TODO 가까운 순 옆 아이콘

                            showModalBottomSheet(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),

                            ),context: context, builder: (BuildContext context){

                              return _buttomSheet(h_percent * height_whole,w_percent * width_whole, context);
                            });
                          }, icon: Icon(Icons.keyboard_arrow_down, size : 24, color : Color(0xffACACAC))),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
        Container( height:1.0 * h_percent,
          width:width_whole * w_percent,
          color:Color(0xffEFEFEF),),
        SizedBox(
          width: width_whole * w_percent,
          height:97 * h_percent * 7,
          child: ListView.builder(

              padding: EdgeInsets.zero,

              itemCount: 7 ,
              itemBuilder: (BuildContext context , int index){
                return _myCafeListOne(w_percent, h_percent, index);
              }
          ),
        ),

      ],
    );

  }




  Widget _myCafeListOne(double w_percent, double h_percent, int index){
    return index == 6 ?  _listLastOne(w_percent, h_percent) : Container(
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
                              child: Image.network('https://picsum.photos/250?image=11', fit: BoxFit.cover),
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
                              width : 242 * w_percent,


                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("투썸플레이스", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
                                  CafeinStoreStatus.plusOpenStatus(w_percent, w_percent, true,0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.person,size : 16, color :CafeinColors.grey300),
                                      Text("카공족 2명이 카페에 있어요", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          index == 2? Container() :Container( height:1.0,
            width: 360 * w_percent,
            color:Color(0xffEFEFEF),)
        ],
      ),
    );
  }

  Widget _listLastOne(double w_percent, double h_percent){
    return Container(

      height: 168 * h_percent,
      width: width_whole * w_percent,
      child:Center(
        child:Container(
          width : 268 * w_percent,
          height: 96 * h_percent,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children : [
                Text("더이상 등록된 카페가 없어요",  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600)
                ),
                Text("카페의 하트를 눌러 나의 카페로 등록해보세요",  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600)
                ),
                Padding(
                  padding:EdgeInsets.only(top : 16 * h_percent),
                  child: Container(
                    width : 113 * w_percent,
                    height: 40 * h_percent,
                    child: IconButton(
                      padding: EdgeInsets.zero, // 패딩 설정
                      constraints: BoxConstraints(), // constraints
                      onPressed: () {},
                      icon: Container(
                        width : 268 * w_percent,
                        height: 96 * h_percent,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color :CafeinColors.orange500
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(8.0)
                          ),
                        ),
                        child: Center(child: Text("카페 찾아보기",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.orange500) ),),
                      ),
                    ),
                  ),
                )
              ]


          ),
        ),
      ),
    );
  }

  Widget _buttomSheet(double height, double width, BuildContext context){
    return Container(

        height: 208 * height / height_whole,
        decoration: BoxDecoration(
            color : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),

            )
        ),
        child: Padding(
          padding: EdgeInsets.only(top : 20 * height / height_whole),
          child: Column(
            children: [
              ElevatedButton(
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  elevation: MaterialStateProperty.all(0.0),
                ),
                onPressed: (){
                  order = 0;
                  Navigator.pop(context);
                  setState(() {

                  });
                },
                child: Container(
                  height: 56 * height / height_whole,
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.5,

                        child: Padding(
                          padding: EdgeInsets.only(left : 24 * width / width_whole),
                          child: Text("가까운순", style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w500, color : order == 0 ? Color(0xffFC6406) : Colors.black),),
                        ),
                      ),
                      Container(
                        width: width * 0.4,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right : 27 * width / width_whole),
                              child: order == 0 ? Icon(Icons.check, size : 24, color :Color(0xffFC6406) ) : Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  elevation: MaterialStateProperty.all(0.0),
                ),
                onPressed: (){
                  order = 1;
                  Navigator.pop(context);
                  setState(() {

                  });
                },
                child: Container(
                  height: 56 * height / height_whole,
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.5,

                        child: Padding(
                          padding: EdgeInsets.only(left : 24 * width / width_whole),
                          child: Text("혼잡도낮은순", style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w500, color : order == 1 ? Color(0xffFC6406) : Colors.black),),
                        ),
                      ),
                      Container(
                        width: width * 0.4,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right : 27 * width / width_whole),
                              child:order == 1? Icon(Icons.check, size : 24, color :Color(0xffFC6406) ) : Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  elevation: MaterialStateProperty.all(0.0),
                ),
                onPressed: (){
                  order = 2;
                  Navigator.pop(context);
                  setState(() {

                  });
                },
                child: Container(
                  height: 56 * height / height_whole,
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.5,

                        child: Padding(
                          padding: EdgeInsets.only(left : 24 * width / width_whole),
                          child: Text("추천순", style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w500, color : order == 2 ? Color(0xffFC6406) : Colors.black),),
                        ),
                      ),
                      Container(
                        width: width * 0.4,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right : 27 * width / width_whole),
                              child: order == 2 ? Icon(Icons.check, size : 24, color :Color(0xffFC6406)) : Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }


}
