import 'package:cafein_front/Main/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SearchScreen extends StatefulWidget {

  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
  FocusNode focusNode = FocusNode(); //TODO for 키보드 고정
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    focusNode.requestFocus();
    return GestureDetector(
      onTap: (){
        focusNode.unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            _noResult(height, width)
            ,Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top : height * 89/ height_whole),
                    child: Center(
                      child: Container( height:1.0,
                        width:width ,
                        color:Color(0xffEFEFEF),),
                    ),
                  ),
                ],
              )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(

                  width: width,
                  height: height * 56 / width_whole,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 10 / width_whole, right: width * 20 / width_whole),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      Container(
                        height: 44 * height / height_whole,
                        width: width * 307 / width_whole,
                        child: Center(
                          child: TextField(
                            onChanged: (text){

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
              ],
            )

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
  }
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
  }
}
