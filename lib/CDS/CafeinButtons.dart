import 'package:cafein_front/CDS/CafeinColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CafeinButtons{

  static Widget OrangeButton(double my_height, double my_width, String text, bool able){
    return Container(
      width: my_width,
      height: my_height,

      decoration: BoxDecoration(
        color: able ? CafeinColors.orange400 : CafeinColors.grey100,
        borderRadius: BorderRadius.all(
            Radius.circular(8.0) // POINT
        ),
      ),
      child: Center(
        child: Text(text, style: TextStyle(fontFamily: 'MainFont', fontSize: 15, fontWeight: FontWeight.w500, color : able? Colors.white :CafeinColors.grey400),),
      ),
    );
  }

}