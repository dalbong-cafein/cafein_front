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

            Container(
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

  Widget _cafeListOne(double height, double width ){
    return Column(
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
                      child: Text("투썸플레이스 합정역점", style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w600),),
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
    );
  }

  Widget _Search(){
    return Column(

    );
  }
}
