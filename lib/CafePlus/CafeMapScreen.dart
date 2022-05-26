import 'dart:async';

import 'package:cafein_front/CDS/CafeinButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';

class CafeMapScreen extends StatefulWidget {
  const CafeMapScreen({Key? key}) : super(key: key);

  @override
  _CafeMapScreenState createState() => _CafeMapScreenState();
}

class _CafeMapScreenState extends State<CafeMapScreen> {
  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      OverlayImage.fromAssetImage(
        assetName: 'imgs/markerimg.png',

      ).then((image) {
        setState(() {
          _markers.add(Marker(
              markerId: 'id',
              position: LatLng(37.6233888589655, 127.078108519779),
              alpha: 0.8,
              captionOffset: 30,
              icon: image,
              anchor: AnchorPoint(0.5, 1),
              width: 56 ,
              height: 56,
              infoWindow: '인포 윈도우',
              ));
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    var map = NaverMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(37.623570, 127.078)
      ),
      markers: _markers,
      mapType: MapType.Basic,
      onMapCreated: _onMapCreated,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("카공 카페 등록",  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'MainFont', color : CafeinColors.grey800) ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: map,
      bottomSheet: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: w_percent * width_whole,
          height: 146 * h_percent,
          color: Colors.white,
          child: Center(
            child: Container(

              height: 106 * h_percent,
              width: width - 40 * w_percent,
              child: Column(
                children: [
                  CafeinButtons.OrangeButton(48 * h_percent, width - 40 * w_percent, "주소", false),
                  Padding(
                    padding: EdgeInsets.only(top : 10 * h_percent),
                    child: CafeinButtons.OrangeButton(48 * h_percent, width - 40 * w_percent, "주소", true),
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }

  void _onMapCreated(NaverMapController controller){
    if(_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
