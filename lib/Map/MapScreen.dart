import 'dart:async';


import 'package:cafein_front/Map/SearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';




Completer<NaverMapController> _controller = Completer();

class MapScreen extends StatefulWidget {
  final String token;

  const MapScreen(this.token);

  @override
  _MapScreenState createState() => _MapScreenState();
}



class _MapScreenState extends State<MapScreen> {
  
  bool typing = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;

    var map = NaverMap(
      mapType: MapType.Basic,
      onMapCreated: _onMapCreated,
    );


    return Scaffold(
        resizeToAvoidBottomInset : false,
      body: Stack(
        children: [
          map,

          Container(

            width : width,
            height: 84* h_percent,
            color : Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top : 34 * h_percent, left : 16 * w_percent, right : 16 * w_percent , bottom: 10 * h_percent),
              child: TextField(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen(widget.token),));
                },
                cursorColor: CafeinColors.orange500,
                decoration: InputDecoration(

                  hintText:"카페이름, 구, 동, 역 등으로 검색" ,
                  filled: true,
                  prefixIcon: Icon(Icons.search, size : 24, color : Colors.black),
                  suffixIcon: typing ? IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: BoxConstraints(), // constraints
                    onPressed: () {

                    },
                    icon: Icon(Icons.cancel, color : CafeinColors.grey300),
                  ) : Container(width : 1, height: 1,),
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
  void _onMapCreated(NaverMapController controller){
    if(_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }



}

