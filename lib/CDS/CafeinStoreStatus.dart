import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CafeinStoreStatus{
  static Widget _storeStatus(double myheight, double mywidth, int status){ //TODO 영업중 표시, 혼잡도 상태를 int(0,1,2)로 받음
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

  static Widget _storeOpen(double myheight, double mywidth, bool open){ //TODO 영업중 표시
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

  static Widget _plusOpenStatus(double height , double width, bool open, int status, int width_whole, int height_whole){
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
  static Widget _disLikeHeart(int dis, int like, int heart, double width, double height){
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
}