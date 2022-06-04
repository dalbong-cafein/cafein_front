import 'package:cafein_front/Login/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CafeinButtons.dart';
import 'CafeinColors.dart';

class CafeinErrorDialog{
  static Future<bool> showdialog(double h_percent, double w_percent , BuildContext context) async{
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
          height: 180 * h_percent,
          width: 300 * w_percent ,
          child: Column(

            children: [
              Padding(
                padding:EdgeInsets.only(top : 30 * h_percent),
                child: Text("일시적인 오류입니다", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'MainFont', color: CafeinColors.grey800),),
              ),

              Padding(
                padding: EdgeInsets.only(top : 12 * h_percent),
                child: Text("잠시 후 다시 시도해 주세요", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'MainFont', color: CafeinColors.grey600),),
              ),
              Padding(
                padding: EdgeInsets.only(top : 1* h_percent),
                child: Text("같은 문제가 반복되면 문의하기를 눌러주세요", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'MainFont', color: CafeinColors.grey600),),
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
                            icon: CafeinButtons.OrangeButton(44 * h_percent, 130 * w_percent, "문의하기", false)
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
                            onPressed: () {
                              Navigator.pop(dialogcontext);
                              Navigator.pop(context);

                            },
                            icon: Container(
                                width: 130 * w_percent,
                                height: 44 * h_percent,
                                child:  CafeinButtons.OrangeButton(44 * h_percent, 130 * w_percent, "뒤로 가기", true)
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
    });

  }

}