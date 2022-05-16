import 'dart:convert';

import 'package:cafein_front/CDS/CafeinColors.dart';
import 'package:cafein_front/Datas/SearchCafe.dart';
import 'package:cafein_front/Main/MainScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:http/http.dart' as http;

import 'CafeScreen_UT.dart';
List<dynamic> searchLog_Name = [null];
List<dynamic> searchLog_Date = [null];
bool searched = false;
class SearchScreen extends StatefulWidget {
  final String token;
  const SearchScreen(this.token);


  @override
  _SearchScreenState createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
  String searchText = "";
  bool checked = false;
  FocusNode focusNode = FocusNode(); //TODO for 키보드 고정
  int order = 0; //TODO 0 -> 가까운순 , 1 -> 혼잡도 낮은 순 , 2 -> 추천 순
  List<dynamic> searchCafes = [];



  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    Widget thiswidget = _searchStart(height, width);
    if(searchText != ""){
      thiswidget = searchCafes.length != 0 ? _cafeList(height, width) : _noResult(height, width, searchText);
    }
    else if(searchLog_Name[0] != null){
      thiswidget = _searchLogList(height, width);
    }
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Padding(
        padding: EdgeInsets.only(top : height * 28 / height_whole),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(

              width: width,
              height: height * 56 / height_whole,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 10 / width_whole, right: width * 5/ width_whole),
                    child: IconButton(icon : Icon(Icons.arrow_back_ios), onPressed: (){
                      Navigator.pop(context);
                    },),
                  ),
                  Container(
                    height: 44 * height / height_whole,
                    width: width * 307 / width_whole,
                    child: Center(
                      child: TextField(
                        scrollPadding: EdgeInsets.only(bottom: height * 0.8),
                        onChanged: (text) async {
                          searchText = text;
                          await _searchResult_Reigon();
                        },
                        textInputAction : TextInputAction.go,
                        onSubmitted: (text) async {
                          searchText = text;
                          _plusLog(text);
                          await _searchResult();
                          setState(() {

                          });
                        },
                        autofocus: true,
                        cursorColor: Color(0xffFC6406),
                        decoration: InputDecoration(
                          hintText:"카페이름, 구, 동, 역 등으로 검색" ,
                          filled: true,
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
              ),
            ),
            //searchLog_Name[0] != null ? _searchLogList(height, width) : _searchStart(height, width)
            thiswidget
          ],
        ),
      ),
    );
  }

  Widget _searchStart(double height , double width){
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only( top :1  / height_whole * height),
            child: Container( height:1.0,
              width:500.0,
              color:Color(0xffEFEFEF),),
          ),
          Padding(
            padding: EdgeInsets.only(top : 201 / height_whole* height ),
            child: Container(
              height: 118 / height_whole * height,
              width: 180 / width_whole * width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Image.asset("imgs/searchstartimg.png"), height: 67 / height_whole * height,width: 72 / width_whole * width,),
                  Padding(
                    padding: EdgeInsets.only(top : 21 / height_whole * height),
                    child: Text("카페 이름, 구, 역 등으로 검색하세요", style: TextStyle(color : Color(0xff646464), fontSize: 13, fontFamily: 'MainFont', fontWeight: FontWeight.w400),),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }//TODO 처음에 search 시작할떄

  Widget _noResult(double height, double width, String text){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only( top :1  / height_whole * height),
          child: Container( height:1.0,
            width:500.0,
            color:Color(0xffEFEFEF),),
        ),
        Padding(
          padding: EdgeInsets.only(top : 201 / height_whole* height ),
          child: Center(
            child: Container(
              height: 120 / height_whole * height,
              width: 172 / width_whole * width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Image.asset("imgs/noresultimg.png"), height: 80 / height_whole * height,width: 57 / width_whole * width,),
                  Padding(
                    padding: EdgeInsets.only(top : 10 / height_whole * height),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(text, style: TextStyle(color : Color(0xffFC6406), fontSize: 14, fontFamily: 'MainFont', fontWeight: FontWeight.w500),),
                        Text("의검색 결과가 없습니다", style: TextStyle(color : Color(0xff646464), fontSize: 14, fontFamily: 'MainFont', fontWeight: FontWeight.w400),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  } //TODO 만약 결과가 없을 경우

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

  Widget _plusOpenStatus(double height , double width, bool open, int status){
    return Row(
      children: [

        Padding(
          padding: EdgeInsets.only(right : width * 4/ width_whole),
          child: _storeOpen(height * 20 / height_whole, width * 45 / width_whole, open),
        ),
        open ? _storeStatus(height * 20 / height_whole, width * 34 / width_whole, status) : Container()

      ],
    );
  }

  Widget _disLikeHeart(int dis, int like, int heart, double width, double height){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.near_me, size: 16,color : Color(0xff646464)),
        Padding(
          padding: EdgeInsets.only(left : width * 2/ width_whole),
          child: Text(dis.toString() + "m", style: TextStyle(fontSize: 12, fontFamily: 'MainFont', fontWeight: FontWeight.w500,color : Color(0xff646464) ),),
        ),
        Padding(
          padding: EdgeInsets.only(left : width * 4/ width_whole),
          child: Icon(Icons.recommend, size : 16, color : Color(0xffFC6406), ),
        ),
        Padding(
          padding: EdgeInsets.only(left : width * 2/ width_whole),
          child: Text(like.toString() + "%", style: TextStyle(fontSize: 12, fontFamily: 'MainFont', fontWeight: FontWeight.w500,color : Color(0xff646464) ),),
        ),
        Padding(
          padding: EdgeInsets.only(left : width * 4/ width_whole),
          child: Icon(Icons.favorite, size : 16, color : Color(0xffFC7521)),
        ),
        Padding(
          padding: EdgeInsets.only(left : width * 2/ width_whole),
          child: Text(heart.toString() , style: TextStyle(fontSize: 12, fontFamily: 'MainFont', fontWeight: FontWeight.w500,color : Color(0xff646464) ),),
        )
      ],
    );
  }

  Widget _cafeListOne(double height, double width , int index){
    return GestureDetector(
      onTap: (){

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CafeScreen_UT(widget.token, searchCafes[index]['storeName'])),
        );
      },
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 96 / height_whole,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top : height * 16 / height_whole, left : width * 16 / width_whole),
                  child: Container(
                    height: height * 64 / height_whole,
                    width: height * 64 / height_whole,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Image border
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(48), // Image radius
                        child: Image.network(searchCafes[index]['storeImageDto']?['imageUrl'] != null ?searchCafes[index]['storeImageDto']['imageUrl'] : 'https://googleflutter.com/sample_image.jpg', fit: BoxFit.cover),
                      ),
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left : width * 12 / width_whole, top :height * 16 / height_whole),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 242 / width_whole,
                        height: height * 16 / height_whole,
                        child: Text(searchCafes[index]['storeName'],  style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w600),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top :  height * 4 / height_whole),
                        child: _plusOpenStatus(height, width, searchCafes[index]['isOpen'] != null ?searchCafes[index]['isOpen'] : false , 0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top :  height * 6 / height_whole),
                        child: _disLikeHeart(999, 99, searchCafes[index]['heartCnt'], width, height),
                      )

                    ],
                  ),
                )

              ],
            ),
          ),
          Center(
            child: Container( height:1.0,
              width:width * 343 / width_whole,
              color:Color(0xffEFEFEF),),
          ),
        ],
      ),
    );
  } //TODO cafelist 하나
  Widget _cafeList(double height, double width){
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
        Container(
          width : width,
          height: height * 42 / height_whole,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:  MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left : width * 16 / width_whole),
                child: Checkbox(value: checked, onChanged: (value){
                  //TODO check 할시
                  setState(() {
                    checked = !checked;
                  });
                },
                  activeColor: Color(0xffFC6406),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left : width * 6 / width_whole, right :order == 1 ? width * 125 / width_whole : width * 150 / width_whole ),
                child: Text("영업중만 표시", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, fontFamily: 'MainFont'),),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 4 / width_whole),
                child: Text(text, style: TextStyle(color : Color(0xffACACAC), fontSize: 13, fontWeight: FontWeight.w500, fontFamily: 'MainFont')),
              ),
              IconButton(onPressed: (){
                //TODO 가까운 순 옆 아이콘

                showModalBottomSheet(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),

                ),context: context, builder: (BuildContext context){

                  return _buttomSheet(height, width, context);
                });
              }, icon: Icon(Icons.keyboard_arrow_down, size : 11, color : Color(0xffACACAC)))
            ],
          ),
        ),
        Container( height:1.0,
          width:width,
          color:Color(0xffEFEFEF),),
        SizedBox(
          width: width,
          height: height * 97 / height_whole  * 7,
          child: ListView.builder(

              padding: EdgeInsets.zero,
              //TODO 스크롤을 내릴수 없도록
              itemCount: searchCafes.length ,
              itemBuilder: (BuildContext context , int index){
                return _cafeListOne(height, width, index);
              }
          ),
        )
      ],
    );

  } //TODO 체크박스 + cafelist
  Widget _cafeListNoImgOne(double height, double width){
    return Column(
      children: [
        Container(
          width : width,
          height: 71 * height  /height_whole,

          child: Padding(
            padding: EdgeInsets.only(left : 20 * width / width_whole),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("투썸플레이스 " , style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w500, color : Color(0xffFC6406)),),
                    Text("합정역점" , style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w500, color: Colors.black))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top : 8 * height / height_whole),
                  child: Text("서울특별시 마포구 양화로 45"),
                ),

              ],

            ),
          ),

        ),
        Center(
          child: Container( height:1.0,
            width:width * 343 / width_whole,
            color:Color(0xffEFEFEF),),
        ),
      ],
    );
  }
  Widget _cafeListNoImg(double height, double width){ //TOdo height ->  72 * 갯수 
    return SizedBox(
      height: 72 * height / height_whole * 5,
      width : width,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          //TODO 스크롤을 내릴수 없도록
          itemCount: 5,
          itemBuilder: (BuildContext context , int index){
            return _cafeListNoImgOne(height, width);
          }
      ),
    );
  }
  Widget _searchLog(double height, double width, int index){
    return Container(
      width : width,
      height :  52 * height / height_whole,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 278 * width / width_whole,
                child: Row(//TODO 왼쪽 요소들(아이콘, 점포명)
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18 * width / width_whole, right: 8 * width / width_whole),
                      child: Icon(Icons.search,size: 16, color : Color(0xff646464)),
                    ),
                    Text(searchLog_Name[index], style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w500, color : Color(0xff333333)),),
                  ],
                ),
              ),
              Container(
                width : width - (278 * width / width_whole),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.end,
                  children: [
                    Text(searchLog_Date[index], style: TextStyle(fontSize: 12, fontFamily: 'MainFont', fontWeight: FontWeight.w500, color : Color(0xffACACAC))),
                    IconButton(icon : Icon(Icons.close, size : 24, color: Color(0xffACACAC),),
                      onPressed: (){


                        if(searchLog_Name.length == 1){
                          searchLog_Name[0] = null;
                          searchLog_Date[0] = null;
                        }else{
                          searchLog_Name.removeAt(index);
                          searchLog_Date.removeAt(index);
                        }
                        setState(() {


                        });

                        //TODO 취소버튼 누르면
                      },
                    )
                  ],
                ),
              )
            ],
          ),
          Center(
            child: Container( height:1.0,
              width:width ,
              color:Color(0xffEFEFEF),),
          ),

        ],
      ),
    );
  } //TODO 최근검색어

  Widget _searchLogList(double height, double width){ //TODO height -> 53 * 갯수
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only( top :1  / height_whole * height),
          child: Container( height:1.0,
            width:500.0,
            color:Color(0xffEFEFEF),),
        ),
        Container(
          width : width,
          height: 46 * height_whole / height,
          child: Padding(
            padding: EdgeInsets.only(top : 20 / height_whole * height),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width : width * 0.5,
                  child: Padding(
                    padding: EdgeInsets.only( left : 16 / width_whole * width),
                    child: Text("최근 검색어",style: TextStyle(fontSize: 14, fontFamily: 'MaonFont', fontWeight: FontWeight.w500, color: CafeinColors.grey800),),
                  ),
                ),
                Container(
                  width : width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right : 16 / width_whole * width),
                        child: Container(

                          width : 60 * width_whole / width,
                          height: 14 * height_whole / height,
                          child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {
                              searchLog_Name = [null];
                              searchLog_Date = [null];
                              setState(() {

                              });

                            },
                            icon: Text("전체 삭제", style: TextStyle(fontSize: 13, fontFamily: 'MaonFont', fontWeight: FontWeight.w500, color: CafeinColors.grey600),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
        Container(
            height: 670 / height_whole* height ,
            width: width,

            child:ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
              //TODO 스크롤을 내릴수 없도록
                itemCount: searchLog_Name.length,
                itemBuilder: (BuildContext context , int index){
                  return _searchLog(height, width, index);
                }
            )
        ),
      ],
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
  Future<void> _searchResult() async {
    var url = Uri.parse("https://api.cafeinofficial.com/stores?keyword=" + searchText);
    print("=====" + searchText + "으로 검색한 결과");
    var response = await http.get(url, headers: <String, String>{'oAuthAccessToken' : widget.token});
    Map<String , dynamic> message = await jsonDecode(utf8.decode(response.bodyBytes));
    print(await message['data'].toString() + "======카페이름");
    searchCafes = message['data'];
    print("list======" + searchCafes.toString());
    print(searchCafes[0]['storeImageDto']['imageUrl'].toString() +"======storeID ");

  }
  Future<void> _searchResult_Reigon() async {
    var url = Uri.parse("https://api.cafeinofficial.com/stores/recommend-search?keyword=" + searchText);
    print("=====" + searchText + "으로 검색한 결과 == 지역");
    var response = await http.get(url, headers: <String, String>{'oAuthAccessToken' : widget.token});
    print(response.toString());
    Map<String , dynamic> message = await jsonDecode(utf8.decode(response.bodyBytes));
    print(await message['message'].toString() + "======카페이름 == 지역");

    //print(searchCafes[0]['adress']['siNm'].toString() +"======storeID ");

  }

  Future<void> _roadData() async {
    var dio = new Dio();
    var accesstoken = widget.token;
    dio.options.headers = {'cookie' : "accessToken=$accesstoken"};

    //dio.options.queryParameters = {'storeId' : 1 ,"Recommendation" : "GOOD", "content" : "123", "socket" : 1, "wifi" : 1, "restroom" : 1, "tableSize" : 1};
    var res_dio = await dio.post("https://api.cafeinofficial.com/stores?keyword=");
    print(res_dio.data.toString());

  }
  void _plusLog(String text){
    var now = new DateTime.now();
    String formateDate = DateFormat('MM/dd').format(now);
    print(formateDate.toString());
    if(searchLog_Name[0] == null){
      searchLog_Name[0] = text;
      searchLog_Date[0] = formateDate;
    }
    else{
      searchLog_Date.add(formateDate);
      searchLog_Name.add(text);
    }


  }

}
