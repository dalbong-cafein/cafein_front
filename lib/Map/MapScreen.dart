import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';


Completer<NaverMapController> _controller = Completer();

class MapScreen extends StatelessWidget {

  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NaverMap(
            mapType: MapType.Basic,
            onMapCreated: _onMapCreated,
          ),

        ],

      )
    );
  }
  void _onMapCreated(NaverMapController controller){
    if(_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

}

