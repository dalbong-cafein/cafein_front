import 'dart:convert';

import 'package:cafein_front/Main/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:http/http.dart' as http;

import 'CafeScreen_UT.dart';


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

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;

    return Scaffold(
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
                        onChanged: (text){
                          searchText = text;
                          _searchResult();
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
            _cafeList(height, width)

          ],
        ),
      ),
    );
  }

  Widget _searchStart(double height , double width){
    return Center(
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
    );
  }//TODO 처음에 search 시작할떄

  Widget _noResult(double height, double width){
    return Center(
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
                  Text("다봉쓰", style: TextStyle(color : Color(0xffFC6406), fontSize: 14, fontFamily: 'MainFont', fontWeight: FontWeight.w500),),
                  Text("의검색 결과가 없습니다", style: TextStyle(color : Color(0xff646464), fontSize: 14, fontFamily: 'MainFont', fontWeight: FontWeight.w400),)
                ],
              ),
            )
          ],
        ),
      ),
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

  Widget _cafeListOne(double height, double width , String name){
    return GestureDetector(
      onTap: (){
        print(name + "clicked");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CafeScreen_UT(widget.token, name)),
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
                    child: Image.asset("imgs/twosome_img.png"),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
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
                        child: Text(name,  style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w600),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top :  height * 4 / height_whole),
                        child: _plusOpenStatus(height, width, true, 0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top :  height * 6 / height_whole),
                        child: _disLikeHeart(999, 99, 999, width, height),
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
          height: height * 97 / height_whole  * 5,
          child: ListView.builder(

              //TODO 스크롤을 내릴수 없도록
              itemCount: 5,
              itemBuilder: (BuildContext context , int index){
                return _cafeListOne(height, width, "투썸플레이스 합정역점");
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
      child: ListView(
        physics: const NeverScrollableScrollPhysics(), //TOdo no scroll
        children: [
          _cafeListNoImgOne(height, width),
          _cafeListNoImgOne(height, width),
          _cafeListNoImgOne(height, width),
          _cafeListNoImgOne(height, width),
          _cafeListNoImgOne(height, width)
        ],
      ),
    );
  }
  Widget _searchLog(double height, double width){
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
                    Text("투썸플레이스", style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w500, color : Color(0xff333333)),),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:MainAxisAlignment.end,
                children: [
                  Text("05.03", style: TextStyle(fontSize: 12, fontFamily: 'MainFont', fontWeight: FontWeight.w500, color : Color(0xffACACAC))),
                  IconButton(icon : Icon(Icons.close, size : 16 , color: Color(0xffACACAC),),
                    onPressed: (){

                      //TODO 취소버튼 누르면
                    },
                  )
                ],
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
    return Container(
        height: 53 * height/ height_whole * 4,
        width: width,
        child:ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _searchLog(height, width),
            _searchLog(height, width),
            _searchLog(height, width),
            _searchLog(height, width)
            
          ],
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
  Future<void> _searchResult() async {
    var url = Uri.parse("https://api.cafeinofficial.com/stores?keyword=" + "성북구");
    var response = await http.get(url, headers: <String, String>{'oAuthAccessToken' : widget.token});
    print(response.headers );
    Map<String , dynamic> message = jsonDecode(utf8.decode(response.bodyBytes));
    print(message['message']);
  }

}
