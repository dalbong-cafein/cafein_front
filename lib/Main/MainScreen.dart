import 'dart:async';
import 'dart:convert';

import 'package:cafein_front/CDS/CafeinStoreStatus.dart';
import 'package:cafein_front/Login/RegisterScreen.dart';
import 'package:cafein_front/Main/MycafeScreen.dart';
import 'package:cafein_front/Main_4/Four_MycafeScreen.dart';
import 'package:cafein_front/Main_4/Four_MyreviewScreen.dart';
import 'package:cafein_front/Sticker/CuponScreen.dart';
import 'package:cafein_front/Sticker/StickerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../CDS/CafeinButtons.dart';
import '../CDS/CafeinColors.dart';
import '../Map/SearchScreen.dart';
import 'MyCafeScreen.dart';
String imgurl = " ";
var nickname;
var profileimg;
int width_whole = 360;
int height_whole = 812;
class MainScreen extends StatefulWidget {
  final String token;
  const MainScreen(this.token);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 1 ; //TODO like fragment
  List<int> cafe_list = [1, 1, 1, 1, 1];
  List<bool> favs = [false, false, false , false, false, false, false, false, false, false];
  List<String> cafe_names = ["커피니 상계역점", "커피니 중계점", "투썸플레이스 노원점", "스타벅스 길음점", "이디야 국민대후문점"];
  var alarmdata;
  Completer<NaverMapController> _controller = Completer();
  void _onMapCreated(NaverMapController controller){
    if(_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

  @override
  void initState() {
    _roadProfile();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var map = NaverMap(
      mapType: MapType.Basic,
      onMapCreated: _onMapCreated,
    );

    print(cafe_list.length.toString());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;

    return Scaffold(
      bottomNavigationBar: _bottomnavigation(),
      body: IndexedStack(
        index: currentIndex, //TODO 바텀네비게이션뷰 선택하면 숫자 바뀌도록함
       children: [
          _MainWidget_new(h_percent, w_percent),
          _MainWidget2(h_percent, w_percent, map),
          _MainWidget3(h_percent, w_percent),
          _MainWidget4(height, width)
        ],

      ),

    );
  }



  Widget _bottomnavigation(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      unselectedItemColor: Color(0xffACACAC),
      currentIndex: currentIndex,
      showSelectedLabels: false, //TODO 아이콘만 보이도록
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon : Icon(Icons.home),
          label: "hello"
        ),
        BottomNavigationBarItem(
          icon : Icon(Icons.search),
            label: "hello"
        ),
        BottomNavigationBarItem(
          icon : Icon(Icons.notifications),
            label: "hello"
        ),
        BottomNavigationBarItem(
          icon : Icon(Icons.more_horiz),
            label: "hello"
        ),

      ],


    );

  }
  //TODO 클릭된 메뉴 index 반영
  void onTabTapped(int index) { setState(() { currentIndex = index; }); }
  Widget _MainWidget_new(double h_percent, double w_percent){
    return Scaffold(
      appBar: PreferredSize(preferredSize : Size.fromHeight(56 * h_percent),child: AppBar(title: Text("cafein", style: TextStyle(color: CafeinColors.grey400, fontFamily: 'TitleFont_Eng', fontWeight: FontWeight.w700, fontSize: 30),),backgroundColor: Colors.white,)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top : 10 * h_percent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left : 16 * w_percent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 56 * h_percent,
                      width: 56 * h_percent,
                      child: ClipOval(
                        child: SizedBox.fromSize(

                          size: Size.fromRadius(56), // Image radius
                          child: profileimg != null ? profileimg : Image.asset("imgs/appimg.png"),
                        ),
                      ),
                    ),
                    Container(
                        width : 125 * w_percent,
                        height: 56 * h_percent,

                        child: Padding(
                          padding: EdgeInsets.only(left : 16 * w_percent),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 44 * h_percent,
                                width: 109 * w_percent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width : 109 * w_percent,
                                      height: 24 * h_percent,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(nickname != null ? nickname : " ", style: TextStyle(fontSize: 18, fontWeight:FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800 ),),
                                          Container(
                                            height: 24 * h_percent,
                                            width: 24 * h_percent,
                                            child: IconButton(
                                              padding: EdgeInsets.zero, // 패딩 설정
                                              constraints: BoxConstraints(), // constraints
                                              onPressed: () {},
                                              icon: Icon(Icons.arrow_forward_ios, size : 18, color :CafeinColors.grey400),
                                            ),

                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width : 109 * w_percent,
                                      height: 20 * h_percent,
                                      child: Padding(
                                        padding: EdgeInsets.only( top : 3 * h_percent),
                                        child: Text("카페인 130일차",style: TextStyle(fontSize: 13, fontWeight:FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey400 ) ),
                                      ),
                                    )
                                  ],
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
                padding:EdgeInsets.only(top : 20 * h_percent),
                child: Container(
                  width: w_percent * width_whole - 32 * w_percent,
                  height: 48 * h_percent,
                  decoration: BoxDecoration(
                    color : CafeinColors.grey200,
                    borderRadius: BorderRadius.all(
                        Radius.circular(12.0)
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(left : 12 * w_percent),
                        child: Container(
                          height: 26 * h_percent,
                          width: 43 * w_percent,
                          child: Image.asset("imgs/stickerimg.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left : 10 * w_percent),
                        child: Text("내가 모은 스티커" , style: TextStyle(fontSize: 14, fontWeight:FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey700 )),
                      ),
                      Text(" 12", style: TextStyle(fontSize: 14, fontWeight:FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.orange500)),
                      Text("개", style: TextStyle(fontSize: 14, fontWeight:FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey700 ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top : 24 * h_percent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left : 16 * w_percent),
                      child: Text("나의 카페", style: TextStyle(fontSize: 16, fontWeight:FontWeight.w600, fontFamily: 'MainFont', color : CafeinColors.grey800 )),
                    ),
                  ],
                ),
              ),
              Column(
               children: [

                 Padding(
                   padding: EdgeInsets.only(top : 20 * h_percent),
                   child: Container(
                     width : w_percent * width_whole,
                     height: 242 * h_percent,

                     child: ListView.builder(
                         itemCount: 3,
                         itemBuilder: (BuildContext context, int index){
                           return _myCafeListOne(w_percent, h_percent, index);
                         }),

                   ),
                 ),
                 Container(
                   width : w_percent * width_whole - 32* w_percent,
                   height: 44 * h_percent,
                   child: IconButton(
                     padding: EdgeInsets.zero, // 패딩 설정
                     constraints: BoxConstraints(), // constraints
                     onPressed: () {



                     },
                     icon: Container(
                       decoration: BoxDecoration(
                         border: Border.all(
                             width: 1,
                             color : CafeinColors.grey400
                         ),
                         borderRadius: BorderRadius.all(
                             Radius.circular(8.0)
                         ),
                       ),
                       width : w_percent * width_whole - 32 * w_percent,
                       height: 44 * h_percent,
                       child: Center(child: Text("나의 카페 모두 보기", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800))),
                     ),
                   ),


                 ),
               ],
             ),
              Padding(
                padding: EdgeInsets.only(top : 20 * h_percent),
                child: Container(
                  width: w_percent * width_whole,
                  height: 10 * h_percent,
                  color : CafeinColors.grey050
                ),
              ),
              _cafeinsPickList(h_percent, w_percent),



            ],
          ),
        ),
      ),
    );
  }
  

  Widget _myCafeListOne(double w_percent, double h_percent, int index){
    return Container(
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


  Widget _cafeinsPickList(double h_percent, double w_percent){
    return Container(
        height: 398 * h_percent,
        width: w_percent * width_whole,
        child:Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left : 16 * w_percent , top : 20 * h_percent),
                  child: Text("카페인'S PICK", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'MainFont' )),
                ),

              ],
            ),
            Padding(
              padding:EdgeInsets.only(top : 16 * h_percent),
              child: Container(
                width : w_percent * width_whole - 32 * w_percent,
                height: 214 * h_percent,
                child: ListView.builder(
                    itemCount: 8,
                    scrollDirection: Axis.horizontal
                    ,itemBuilder: (BuildContext context, int index){
                  return _cafeinsPickListOne(h_percent, w_percent, index);

                }),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top : 30 * h_percent),
              child: _ad(h_percent, w_percent),
            )
          ],
        )
    );
  }
  Widget _cafeinsPickListOne(double h_percent, double w_percent, int index){

    return Container(
      width: 168 * w_percent,
      height: 214 * h_percent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 160 * w_percent,
            height: 214 * h_percent,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color : Color(0xffD1D1D1)
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)
              ),
            ),
            child:Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 160 *w_percent,
                        height: 100 * h_percent,


                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)), // Image border
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48), // Image radius
                            child: Image.network('https://picsum.photos/250?image=9', fit: BoxFit.cover),
                          ),
                        )


                    ),
                    Container(
                      width: 160 *w_percent,
                      height: 111 * h_percent,

                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left : 10 * w_percent, top : 8 * h_percent, right : 10 * w_percent),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("투썸플레이스 메세나폴리스 합정", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400, fontFamily: 'MainFont' )),
                            Padding(
                              padding: EdgeInsets.only(top : 6 * h_percent),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CafeinStoreStatus.plusOpenStatus(h_percent, w_percent, true, 0),
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.only(top : 10 * h_percent),
                              child: CafeinStoreStatus.disLikeHeart(999, 99, 99, w_percent, h_percent),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left : 128 * w_percent, top : 8 * h_percent),
                  child: Container(
                    width : 24 * h_percent,
                    height: 24 * h_percent,
                    child: IconButton(
                      padding: EdgeInsets.zero, // 패딩 설정
                      constraints: BoxConstraints(), // constraints
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border, size : 24 , color : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget _noCafe(double h_percent, double w_percent){
    return Container(
      height: 282 * h_percent,
      width: w_percent * width_whole,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top : 60 * h_percent),
            child: Container(
              width : 49 * w_percent,
              height: 43 * h_percent,
              child: Image.asset("imgs/nocafeimg.png"),
            ),
          ),
          Padding(
            padding:EdgeInsets.only(top : 10 * h_percent),
            child: Text("등록된 나의 카페가 없어요",  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
          ),
          Text("카페의 하트를 눌러 나의 카페로 등록해 보세요",  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
          Padding(
            padding: EdgeInsets.only(top : 16 * h_percent),
            child: Container(
              height: 40 * h_percent,
              width: 113 * w_percent,
              decoration : BoxDecoration(
                border: Border.all(
                    width: 1,
                    color :CafeinColors.orange500
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(8.0)
                ),
              ),
              child: Center(child: Text("카페 찾아보기",  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.orange500) )),
            ),
          )

        ],
      ),
    );
  }
  Widget _ad(double h_percent, double w_percent){
    return Container(
        width : 328 * w_percent,
        height : 72 * h_percent,
        decoration: BoxDecoration(
          color : Color(0xff26BA6A),
          borderRadius: BorderRadius.all(
              Radius.circular(8.0)
          ),
        ),
        child:
        Padding(
          padding: EdgeInsets.only(left : 32 * w_percent),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(

                width : 146 * w_percent,
                height : 38 * h_percent,
                child: Center(child: Text("친구 초대하고 \n무료 아메리카노 쿠폰 받자", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'MainFont' , color : Colors.white))),
              ),
              Padding(
                padding: EdgeInsets.only(left : 49 * w_percent),
                child: Container(
                  width : 69 * w_percent,
                  height: 59.7 * h_percent,
                  child: Image.asset("imgs/cuponadimg.png"),
                ),
              )
            ],
          ),
        )
    );
  }

  Widget _MainWidget(double height , double width){
    return Scaffold(
      appBar: AppBar(title: Text("cafein", style: TextStyle(color: Color(0xffACACAC), fontFamily: 'TitleFont_Eng', fontWeight: FontWeight.w700, fontSize: 30),),backgroundColor: Colors.white,centerTitle: false,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Row(
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48), // Image radius
                      child: profileimg != null ? profileimg : Image.asset("imgs/appimg.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top : height * 0.01, bottom: height * 0.02, left: width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(nickname != null ? nickname : " ", style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold ),),
                            IconButton(icon: Icon(Icons.chevron_right, color: Color(0xffACACAC),
                            ),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterScreen(widget.token)),
                                );

                              },
                            )
                          ],
                        ),
                        Text("카페인 1 일차", style: TextStyle(color: Color(0xffACACAC),fontWeight: FontWeight.normal),)
                      ],
                    ),
                  )


                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top : height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffFFF0E6),
                    ),
                    width: width * 0.46,
                    height: height * 0.08,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: height * 0.05,
                                width: height * 0.05,
                                child: Image.asset("imgs/stamp_icon_image.png"),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("스탬프", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.085, right: width * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color : Color(0xffFC6406)))
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffFFF0E6),
                    ),
                    width: width * 0.46,
                    height: height * 0.08,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.03),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: height * 0.05,
                                width: height * 0.05,
                                child: Image.asset("imgs/cupon_icon_img.png"),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("쿠폰", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.12, right: width * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color : Color(0xffFC6406)))
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : width * 0.05, top : height * 0.05, bottom: height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("나의 카페", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                ],
              ),
            ),
            _cafelistview(height, width, true), //TODO 카페 리스트 뷰
            Padding(
              padding: EdgeInsets.only(top : height * 0.007),
              //TODO 내 카페가 5 개 이하일때는 모두보기 버튼을 없앤다.
              child: cafe_list.length < 5? Container() : Container(
                child: IconButton(
                  icon: Center(
                    child: Text("나의 카페 모두 보기", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  ), onPressed: () {


                },
                ),
                height: height * 0.06,
                width: width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD1D1D1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : width * 0.05, top : height * 0.05, bottom: height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("카페인's PICK", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : width * 0.03),
              child: _rowCafeListview(height, width),
            ),
            Padding(
              padding: EdgeInsets.only(top : height * 0.03),
              child: Center(
                child: Container(
                    width: width * 0.87,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                        color: Color(0xffFFF0F3),
                        borderRadius: BorderRadius.circular(7)
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left : width * 0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("친구 초대하고 쿠폰 받자", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left : width * 0.55, top : height * 0.01),
                          child: Icon(Icons.person,color :Color(0xffFC7521), size : 50),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left : width * 0.66, top : height * 0.03),
                          child: Container(
                            height: height * 0.07,
                            width: height * 0.07,
                            child: Image.asset("imgs/cupon_adv_img.png"),
                          ),
                        ),

                      ],
                  ),
                ),
              ),
            )

          ],

        ),
      )
    );

  }
  Widget _MainWidget2(double h_percent, double w_percent, NaverMap map){
    return Scaffold(
        body: Stack(
          children: [
            map,

            Container(

              width : w_percent * width_whole,
              height: 84* h_percent,
              color : Colors.white,
              child: Padding(
                padding: EdgeInsets.only(top : 34 * h_percent, left : 16 * w_percent, right : 16 * w_percent , bottom: 10 * h_percent),
                child: TextField(

                  cursorHeight: 0,
                  cursorWidth: 0,
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen(widget.token),));
                  },
                  cursorColor: CafeinColors.orange500,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText:"카페이름, 구, 동, 역 등으로 검색" ,
                    filled: true,
                    prefixIcon: Icon(Icons.search, size : 24, color : Colors.black),

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
            )

          ],

        )
    );
  }
  Widget _MainWidget3(double h_percent, double w_percent){

    _loadAlarmData();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h_percent * 56),
        child: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right : 16 * w_percent),
              child:IconButton(
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(), // constraints
                onPressed: () {
                  _onDeleteKey(h_percent, w_percent);
                },
                icon: Icon(Icons.delete_outline_rounded, size : 30 , color : CafeinColors.grey600),
              ),


            )
          ],
          centerTitle: false,
          
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(left : 16 * w_percent),
            child: Text("알림", style: TextStyle(color : Colors.black  ,fontWeight: FontWeight.w600, fontSize: 18, fontFamily: 'MainFont'),),
          ),backgroundColor: Colors.white,),
      ),
      body: Container(

        height: h_percent * height_whole - 56 * h_percent,
        width : w_percent * width_whole,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: alarmdata.length,

            itemBuilder: (BuildContext context , int index){
              //리뷰에 사진이랑 내용 다 없을 경우는 제외시킨다.
              return _alarmListOne(h_percent, w_percent, index);
            }),
      )
    );
  }


  Widget _alarmListOne(double h_percent, double w_percent, int index){
    return Container(
      height: 66 * h_percent, // 두줄일떄는 86
      width : w_percent * width_whole,

      child: IconButton(
        padding: EdgeInsets.zero, // 패딩 설정
        constraints: BoxConstraints(), // constraints
        onPressed: () {
          _readAlarm(alarmdata[index]['noticeId']);
          if(alarmdata[index]["noticeType"] == "스티커"){
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StickerScreen(widget.token)),
            );
          }
          if(alarmdata[index]["noticeType"] == "쿠폰"){
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CuponScreen(widget.token)),
            );
          }

        },
        icon: Container(
          color : alarmdata[index]['isRead']? Colors.white : CafeinColors.grey050,

          height: 66 * h_percent,
          width : w_percent * width_whole,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:EdgeInsets.only(left : 16 * w_percent, top : 14 * h_percent),
                child: Row(
                  children: [
                    Icon(Icons.square, size : 18 , color : CafeinColors.grey300),
                    Padding(
                      padding: EdgeInsets.only(left : 10 * w_percent),
                      child: Text(alarmdata[index]['noticeType'], style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey600) ),
                    )


                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left : 44 * w_percent, top : 4 * h_percent),
                child: Text(alarmdata[index]['content'], style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
              )
            ],
          ),
        )
      ),
    );
  }

  Future<bool> _onDeleteKey(double h_percent, double w_percent) async{
    return await showDialog(context: context, builder: (BuildContext dialogcontext){
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Container(
          decoration: BoxDecoration(
            color : Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(10.0) // POINT
            ),
          ),
          height: 160 * h_percent,
          width: 300 * w_percent ,
          child: Column(

            children: [
              Padding(
                padding:EdgeInsets.only(top : 30 * h_percent),
                child: Text("알림을 모두 삭제하시겠어요?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'MainFont', color: CafeinColors.grey800),),
              ),
              Padding(
                padding: EdgeInsets.only(top : 12 * h_percent),
                child: Text("삭제된 알림은 다시 확인할 수 없습니.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'MainFont', color: CafeinColors.grey600),),
              ),
              Padding(
                padding: EdgeInsets.only(top : 20 * h_percent),
                child: Container(
                  width: 300 * w_percent,
                  height: 44 * h_percent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left : 16 * w_percent),
                        child: Container(
                          width: 130 * w_percent,
                          height: 44 * h_percent
                          ,child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {
                              Navigator.pop(dialogcontext);

                            },
                            icon: CafeinButtons.OrangeButton(44 * h_percent, 130 * w_percent, "취소", false)
                        ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left : 4 * w_percent),
                        child: Container(
                          width: 130 * w_percent,
                          height: 44 * h_percent,
                          child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () async {
                              await _deleteAllAlarm();
                              Navigator.pop(dialogcontext);
                              setState(() {

                              });

                            },
                            icon: Container(
                                width: 130 * w_percent,
                                height: 44 * h_percent,
                                child:  CafeinButtons.OrangeButton(44 * h_percent, 130 * w_percent, "삭제", true)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

        ),
      );
    });}

  Future<void> _deleteAllAlarm() async {


    for(int i = 0 ; i < alarmdata.length ; i ++){
      var url = Uri.parse("https://api.cafeinofficial.com/notices/" + alarmdata[i]['noticeId'].toString());
      var accesstoken = widget.token;
      var response = await http.delete(url , headers: {"cookie" : "accessToken=$accesstoken"});
      Map<String , dynamic> message = jsonDecode(utf8.decode(response.bodyBytes));
      print(message);

    }

  }

  Widget _MainWidget4(double height, double width){
    return SingleChildScrollView(
      child : Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top :62 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right : 18),
                      child: IconButton(icon: Icon(Icons.settings, color : Color(0xff646464), size: 25,),onPressed: (){

                      },),
                    )
                  ],
                ),
              )
            ],
          ),
          Column(

            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top : 84 ),
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.1,
                        width: height * 0.1,
                        child: IconButton(onPressed: (){


                        },
                            icon : ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(68), // Image radius
                                child: profileimg != null ? profileimg : Image.asset("imgs/appimg.png"),
                              ),
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(nickname != null ? nickname : " ", style: TextStyle(fontSize: 18, fontWeight:FontWeight.bold ,color: Color(0xff333333))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text("카공 1일차", style : TextStyle(fontSize: 13, color : Color(0xffACACAC, ), fontFamily: 'MainFont', fontWeight: FontWeight.w500)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left : width * 24/375, right: width *24 /375, top : height * 24 / 375),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(12.0),
                                  color: Color(0xffF6F6F6),
                                ),
                                margin: const EdgeInsets.all(0),
                                width: width * 159.5 / 375,
                                height: height * 73/ 812,
                                child: IconButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Four_MycafeScreen(widget.token)),
                                    );

                                  },
                                  icon: Container(
                                    margin : EdgeInsets.only(top : height * 10 / height_whole),
                                    child: Column(
                                      children: [
                                        Text("내가 등록한 카페", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, fontFamily: 'MainFont', color: Color(0xff646464)),),
                                        Padding(
                                          padding: EdgeInsets.only(top : height * 10 / height_whole),
                                          child: Text("12", style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500, fontFamily: 'MainFont'),),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(12.0),
                                    color: Color(0xffF6F6F6)
                                ),
                                width: width * 159.5 / 375,
                                height: height * 73/ 812,
                                child: IconButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Four_MyreviewScreen(widget.token)),
                                    );

                                  },
                                  icon: Container(
                                    margin : EdgeInsets.only(top : height * 10 / height_whole),
                                    child: Column(
                                      children: [
                                        Text("내가 쓴 리뷰", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, fontFamily: 'MainFont', color: Color(0xff646464)),),
                                        Padding(
                                          padding: EdgeInsets.only(top : height * 10 / height_whole),
                                          child: Text("12", style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500, fontFamily: 'MainFont'),),
                                        )
                                      ],
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

              ),

            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top : height * 338 /  height_whole, bottom: height * 10  /height_whole),
                child: Center(
                  child: Container( height:1.0,
                    width:width * 343 / width_whole,
                    color:Color(0xffEFEFEF),),
                ),
              ),
              Row(

                children: [
                  Container(
                    width: width * 0.5,
                    height: height * 64 / height_whole,
                    child: Padding(
                      padding: EdgeInsets.only(left : width * 24 / width_whole),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("연결된 계정", style: TextStyle(color : Color(0xff333333), fontWeight : FontWeight.w500, fontFamily: 'MainFont', fontSize: 15),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.5,
                    height: height * 64 / height_whole,
                    child : Padding(
                      padding: EdgeInsets.only(right : width * 24 / width_whole),
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right : width * 8 / width_whole),
                                  child: Text("카카오", style: TextStyle(color : Color(0xffACACAC), fontWeight : FontWeight.w500, fontFamily: 'MainFont', fontSize: 13),),
                                ),
                                Icon(Icons.arrow_forward_ios, color : Color(0xffACACAC),size : 15)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top : height * 10 /  height_whole, bottom: height * 10  /height_whole),
                child: Center(
                  child: Container( height:1.0,
                    width:width * 343 / width_whole,
                    color:Color(0xffEFEFEF),),
                ),
              ),
              Row(

                children: [
                  Container(
                    width: width * 0.5,
                    height: height * 64 / height_whole,
                    child: Padding(
                      padding: EdgeInsets.only(left : width * 24 / width_whole),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("공지사항", style: TextStyle(color : Color(0xff333333), fontWeight : FontWeight.w500, fontFamily: 'MainFont', fontSize: 15),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.5,
                    height: height * 64 / height_whole,
                    child : Padding(
                      padding: EdgeInsets.only(right : width * 24 / width_whole),
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Icon(Icons.arrow_forward_ios, color : Color(0xffACACAC),size : 15)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(

                children: [
                  Container(
                    width: width * 0.5,
                    height: height * 64 / height_whole,
                    child: Padding(
                      padding: EdgeInsets.only(left : width * 24 / width_whole),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("자주 묻는 질문", style: TextStyle(color : Color(0xff333333), fontWeight : FontWeight.w500, fontFamily: 'MainFont', fontSize: 15),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.5,
                    height: height * 64 / height_whole,
                    child : Padding(
                      padding: EdgeInsets.only(right : width * 24 / width_whole),
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Icon(Icons.arrow_forward_ios, color : Color(0xffACACAC),size : 15)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(

                children: [
                  Container(
                    width: width * 0.5,
                    height: height * 64 / height_whole,
                    child: Padding(
                      padding: EdgeInsets.only(left : width * 24 / width_whole),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("서비스 이용사항", style: TextStyle(color : Color(0xff333333), fontWeight : FontWeight.w500, fontFamily: 'MainFont', fontSize: 15),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.5,
                    height: height * 64 / height_whole,
                    child : Padding(
                      padding: EdgeInsets.only(right : width * 24 / width_whole),
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Icon(Icons.arrow_forward_ios, color : Color(0xffACACAC),size : 15)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(

                children: [
                  Container(
                    width: width * 0.5,
                    height: height * 64 / height_whole,
                    child: Padding(
                      padding: EdgeInsets.only(left : width * 24 / width_whole),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("개인정보 처리방침", style: TextStyle(color : Color(0xff333333), fontWeight : FontWeight.w500, fontFamily: 'MainFont', fontSize: 15),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.5,
                    height: height * 64 / height_whole,
                    child : Padding(
                      padding: EdgeInsets.only(right : width * 24 / width_whole),
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Icon(Icons.arrow_forward_ios, color : Color(0xffACACAC),size : 15)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top : height * 10 /  height_whole, bottom: height * 10  /height_whole),
                child: Center(
                  child: Container( height:1.0,
                    width:width * 343 / width_whole,
                    color:Color(0xffEFEFEF),),
                ),
              ),
              Row(

                children: [
                  Container(
                    width: width ,
                    height: height * 64 / height_whole,
                    child: Padding(
                      padding: EdgeInsets.only(left : width * 24 / width_whole),
                      child: IconButton(

                        onPressed: (){

                          print("로그아웃 클릭 됨 ========");
                        },
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("로그아웃", style: TextStyle(color : Color(0xffFC6406), fontWeight : FontWeight.w500, fontFamily: 'MainFont', fontSize: 15),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),

            ],
          )
        ],
      ),
    );
  }


  Widget _storeOpen(double myheight, double mywidth, bool open){ //TODO 영업중 표시
    return Container(

      child: Padding(
        padding: EdgeInsets.only(top : myheight * 0.1, bottom: myheight * 0.1 , left: mywidth * 0.2, right:  mywidth * 0.2),
        child: Center(child: Text(open ? "영업중" : "영업 종료", style: TextStyle(color: open ? Color(0xff646464) : Color(0xffD1D1D1)),)),
      ),
        decoration: BoxDecoration(
        border: Border.all(
        color: Color(0xffD1D1D1),
        width: 1,
      ), borderRadius: BorderRadius.circular(5)
        )

    );
  } //TODO open 여부 Container

  Widget _storeStatus(double myheight, double mywidth, int status){ //TODO 영업중 표시, 혼잡도 상태를 int(0,1,2)로 받음
    var status_string;
    var status_color;
    var status_backcolor;
    if(status == 0){
      status_backcolor = Color(0xffDFF5E8);
      status_color = Color(0xff26BA6A);
      status_string = "여유";
    }
    if(status == 1){
      status_backcolor = Color(0xffFFF3E0);
      status_color = Color(0xffFF9800);
      status_string = "보통";
    }
    if(status == 2){
      status_backcolor = Color(0xffFFEBEE);
      status_color = Color(0xffF44336);
      status_string = "혼잡";
    }
    return Container(

        child: Padding(
          padding: EdgeInsets.only(top : myheight * 0.1, bottom:  myheight * 0.1 , left: mywidth * 0.2, right:  mywidth * 0.2),
          child: Text(status_string, style: TextStyle(color: status_color),),
        ),
        decoration: BoxDecoration(
          color: status_backcolor,
            border: Border.all(
              color: status_backcolor,
              width: 1,
            ), borderRadius: BorderRadius.circular(5)
        )

    );
  } //TODO 혼잡도 표시 Container

  Widget _rowCafeListview(double height , double width){//TODO 카페 리스트뷰
    print("listview 다시 빌드됨");
    return SizedBox(
      height: width * 0.6,
      width: width * 5.30,
      child: ListView(

        scrollDirection: Axis.horizontal,
        children: [
          _cafeinPickedCafe(height, width, 0, true, 0),
          _cafeinPickedCafe(height, width, 1, false, 1),
          _cafeinPickedCafe(height, width, 2, true, 2),
          _cafeinPickedCafe(height, width, 0, true , 3),
          _cafeinPickedCafe(height, width, 1, true, 4),
          _cafeinPickedCafe(height, width, 2, false, 5),
          _cafeinPickedCafe(height, width, 0, false, 6),
          _cafeinPickedCafe(height, width, 1, false, 7),
          _cafeinPickedCafe(height, width, 2, false, 9),


        ],
      ),
    );
  }//TODO 카페인픽 가로 리스트 (추천 카페)


  Widget _cafeinPickedCafe(double height , double width, int status, bool open,int fav_int){//TODO 전체 Height, width /가게 혼잡도 / 오픈여부
    print("called - cafeinPickedCafe");

    return Padding(
      padding: EdgeInsets.only(left : width * 0.02),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffD1D1D1),
              width: 1,
            ), borderRadius: BorderRadius.circular(8)
        ),
        width: width * 0.5,
        height: width * 0.5 * 10/9,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("imgs/cafe_img.png", fit : BoxFit.fitWidth)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(

                  height: width * 0.5 * 10/9 * 0.6,
                  child: Padding(
                    padding: EdgeInsets.only(left : width * 0.03, top :width * 0.5 * 10/9 * 0.6 *0.05 ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("투썸플레이스 합정점", style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(top : height * 0.01),
                          child: open ? Row( //TODO 가게가 열었으면 열음 + 혼잡도 / 아니면 열지않음만 표시
                            children: [
                              _storeOpen(height * 0.01, width * 0.1, true),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.01, right: width * 0.2),
                                child: _storeStatus(height*0.01, width * 0.08, status),
                              ),
                            ],
                          ) : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _storeOpen(height * 0.01, width * 0.1, false),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : height * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.near_me, size: 18,),
                              Text("10m", style: TextStyle(color : Color(0xff646464), fontSize: 15),),

                              Padding(
                                padding: EdgeInsets.only(left : width * 0.015),
                                child: Icon(Icons.star, size : 20, color: Color(0xffFFC222),),
                              ),
                              Text("4.5",style: TextStyle(color : Color(0xff646464), fontSize: 15),),

                              Padding(
                                padding: EdgeInsets.only(left : width * 0.015),
                                child: Icon(Icons.favorite, size : 18, color : Color(0xffFC6406)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.005),
                                child: Text("3,847", style: TextStyle(color : Color(0xff646464), fontSize: 15),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.008),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed:(){

                    setState(() {
                      //TODO setState 할때마다 listview가 다시 빌드되어 하트 색깔이 고정되는 문제가 있어서 favs를 전역변수로 생성하고 하트 색을 true false로 관리한다.
                      favs[fav_int]= !favs[fav_int]; //TODO 하트 껐다 켰다 가능
                    });
                  }, icon: favs[fav_int] ? Icon(Icons.favorite, color : Color(0xffFC6406))  : Icon(Icons.favorite_border, color: Colors.white,))
                ],
              ),
            )
          ],
        ),
      ),
    );
  } //TODO 카페인픽 리스트 요소들


  Widget _cafelistview(double height , double width, bool open){ //TODO cafe listview
    return SizedBox( //TODO 리스트뷰에 크기를 제한하지 않으면 오류남

      width: width * 0.9,
      //TODO cafe list * container 의 높이 + container 사이 여백 크키만큼
      //TODO cafe list가 몇개인지에 따라 리스트뷰의 높이가 달라져야 하므로
      height: cafe_names.length * 0.147 * height,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),//TODO 스크롤을 내릴수 없도록
          itemCount: cafe_names.length, //TODO cafe list 수로 제한
          itemBuilder: (BuildContext context , int index){
            return Padding(
              padding: EdgeInsets.only(top : height * 0.007),
              child: Container(
                height: height * 0.14,
                width: width * 0.9,

                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD1D1D1),
                      width: 1,
                    ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: height * 0.15 * 0.8, //TODO 상위 컨테니너의 80 프로 정도 차지
                          width: height * 0.15 * 0.8,
                          child: Image.asset("imgs/twosome_img.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cafe_names[index], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                ],
                              ),
                              open? Row( //TODO 열었으면 오픈 + 혼잡도 표시 아니면 영업 종료만 띄우기
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _storeOpen(height * 0.01, width * 0.1, true),
                                  Padding(
                                    padding: EdgeInsets.only(left: width * 0.01, right: width * 0.21),
                                    child: _storeStatus(height*0.01, width * 0.08, 1),
                                  ),
                                ],
                              ) : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: width * 0.275),
                                    child: _storeOpen(height * 0.01, width * 0.1, false),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.person,color: Color(0xffFC6406),size: 23,),
                                  open ? Text(" 카공족 0명이 카페에 있어요") : Container()
                                ],
                              )
                            ],

                          ),
                        )
                      ],

                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  } //TODO 카페 리스트뷰

  Future<void> _readAlarm(int noticeId) async {
    var url = Uri.parse("https://api.cafeinofficial.com/notices/" + noticeId.toString() + "/read");
    var accesstoken = widget.token;
    var response = await http.patch(url , headers: {"cookie" : "accessToken=$accesstoken"});
    Map<String , dynamic> message = jsonDecode(utf8.decode(response.bodyBytes));
    print(message);



  }

  Future<void> _roadProfile() async {
    print("token으로 프로필 로드 시작 , token :" + widget.token);
    var url = Uri.parse("https://api.cafeinofficial.com/members/info");
    var accesstoken = widget.token;
    var response = await http.get(url , headers: {"cookie" : "accessToken=$accesstoken"});
    Map<String , dynamic> message = jsonDecode(utf8.decode(response.bodyBytes));

    imgurl =message['data']['imageDto']['imageUrl'];
    nickname = message['data']['nickname'];
    profileimg = Image.network(imgurl, fit: BoxFit.fitHeight,);
    print("프로필 로드 완료 ---------- " + profileimg.toString());
    setState(() {//TODO 받은 프로필이 적용될 수 있도록 setState

    });
  } //TODO profile 불러오기

  Future<dynamic> _loadAlarmData() async {

    var url = Uri.parse("https://api.cafeinofficial.com/notices");
    var accesstoken = widget.token;
    var response = await http.get(url , headers: {"cookie" : "accessToken=$accesstoken"});
    Map<String , dynamic> message = jsonDecode(utf8.decode(response.bodyBytes));
    alarmdata = message['data'];
    print(alarmdata);

  }


}
