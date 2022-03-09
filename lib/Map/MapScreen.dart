import 'dart:async';

import 'package:cafein_front/Map/MapSearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';



Completer<NaverMapController> _controller = Completer();

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}



class _MapScreenState extends State<MapScreen> {
  

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;


    var map = NaverMap(
      mapType: MapType.Basic,
      onMapCreated: _onMapCreated,
    );


    return Scaffold(
      body: Stack(
        children: [
          map,

          SafeArea(
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(

                  children: [

                    Container(

                      width: width * 0.9,
                      height: height * 0.06,
                      child: TextField(

                        onChanged:(text){setState(() {

                        });}
                        ,
                        onTap:(){setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapSearchScreen()),
                          );
                        });},
                        cursorColor: const Color(0xffD1D1D1), //커서 안보이게

                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: const Color(0xffD1D1D1),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(width: 1, color: const Color(0xffD1D1D1))
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(width: 1, color: const Color(0xffD1D1D1))
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                )

              ],
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

