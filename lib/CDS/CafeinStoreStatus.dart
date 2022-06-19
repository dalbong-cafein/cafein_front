import 'package:cafein_front/CDS/CafeinColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CafeinStoreStatus{
  static Widget storeStatus(double myheight, double mywidth, int status){ //TODO 영업중 표시, 혼잡도 상태를 int(0,1,2)로 받음
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
        height: myheight,
        width: mywidth,
        child: Center(child: Text(status_string, style: TextStyle(color: status_color, fontFamily: 'MainFont', fontSize: 14, fontWeight: FontWeight.w400),)),
        decoration: BoxDecoration(
            color: status_backcolor,
            border: Border.all(
              color: status_backcolor,
              width: 1,
            ), borderRadius: BorderRadius.circular(4)
        )

    );
  } //TODO 혼잡도 표시 Container

  static Widget storeOpen(double myheight, double mywidth, bool open){ //TODO 영업중 표시
    return Container(
        height: myheight,
        width: mywidth,
        child: Center(child: Text(open ? "영업중" : "영업 종료", style: TextStyle(fontSize:12, fontWeight : FontWeight.w400, fontFamily:"MainFont", color: open ? CafeinColors.orange500 : Color(0xffD1D1D1)),)),
        decoration: BoxDecoration(
            border: Border.all(
              color: open ? CafeinColors.orange500 : Color(0xffD1D1D1),
              width: 1,
            ), borderRadius: BorderRadius.circular(4)
        )

    );
  } //TODO open 여부 Container

  static Widget plusOpenStatus(double h_percent , double w_percent, bool open, int status, ){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.only(right :w_percent * 4),
          child: storeOpen( h_percent * 20 , w_percent * 45 , open),
        ),
        open ? storeStatus( h_percent * 20 , w_percent* 34 , status) : Container()

      ],
    );
  }
  static Widget disLikeHeart(int dis, int like, int heart, double w_percent, double h_percent){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.near_me, size: 16,color : Color(0xff646464)),
        Padding(
          padding: EdgeInsets.only(left : w_percent * 2),
          child: Text(dis.toString() + "m", style: TextStyle(fontSize: 12, fontFamily: 'MainFont', fontWeight: FontWeight.w500,color : Color(0xff646464) ),),
        ),
        Padding(
          padding: EdgeInsets.only(left : w_percent * 4),
          child: Icon(Icons.thumb_up_alt_rounded, size : 16, color : Color(0xffFC6406), ),
        ),
        Padding(
          padding: EdgeInsets.only(left :w_percent * 2),
          child: Text(like.toString() + "%", style: TextStyle(fontSize: 12, fontFamily: 'MainFont', fontWeight: FontWeight.w500,color : Color(0xff646464) ),),
        ),
        Padding(
          padding: EdgeInsets.only(left : 4 * w_percent),
          child: Icon(Icons.favorite, size : 16, color : Color(0xffFC7521)),
        ),
        Padding(
          padding: EdgeInsets.only(left : w_percent * 2),
          child: Text(heart.toString() , style: TextStyle(fontSize: 12, fontFamily: 'MainFont', fontWeight: FontWeight.w500,color : Color(0xff646464) ),),
        )
      ],
    );
  }
}