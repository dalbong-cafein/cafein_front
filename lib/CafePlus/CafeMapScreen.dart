import 'dart:async';

import 'package:cafein_front/CDS/CafeinButtons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../CDS/CafeinColors.dart';
import '../Main/MainScreen.dart';
import '../main.dart';

class CafeMapScreen extends StatefulWidget {
  final double Y;
  final double X;
  final String address;
  const CafeMapScreen(this.Y, this.X, this.address);

  @override
  _CafeMapScreenState createState() => _CafeMapScreenState();
}

class _CafeMapScreenState extends State<CafeMapScreen> {
  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];
  var name;

  @override
  void initState() {
    name = widget.address;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      OverlayImage.fromAssetImage(
        assetName: 'imgs/markerimg.png',

      ).then((image) {
        setState(() {
          _markers.add(Marker(
              markerId: 'id',
              position: LatLng(widget.Y, widget.X),
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
          target: LatLng(widget.Y, widget.X)
      ),

      mapType: MapType.Basic,
      onMapCreated: _onMapCreated,
      onCameraChange: _onCameraChanged,
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
      body: Stack(
        children: [
          map,
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 40 * h_percent),
              child: Container(
                  width: 37 * w_percent,
                  height: 46 * h_percent,
                  child: Image.asset('imgs/markerimg.png', fit:BoxFit.fill)),
            ),
          )
        ],
      ),
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
                  CafeinButtons.OrangeButton(48 * h_percent, width - 40 * w_percent, name, false),
                  Padding(
                    padding: EdgeInsets.only(top : 10 * h_percent),
                    child: CafeinButtons.OrangeButton(48 * h_percent, width - 40 * w_percent, "이 위치에 카공 카페 등록하기", true),
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
  Future<void> _onCameraChanged(LatLng? position, CameraChangeReason reason, bool? b) async {
    print(position.toString());
    var dio = new Dio();

    dio.options.headers = {'Authorization' : "KakaoAK " + kakao_restapi};
    String? x = position?.longitude.toString();
    String? y = position?.latitude.toString();
    //dio.options.queryParameters = {'storeId' : 1 ,"Recommendation" : "GOOD", "content" : "123", "socket" : 1, "wifi" : 1, "restroom" : 1, "tableSize" : 1};
    var res_dio = await dio.get("https://dapi.kakao.com/v2/local/geo/coord2address.json?x="+ x! + "&y=" + y!);
    name = res_dio.data['documents'][0]['address']['address_name'];
    print(name.toString());
    setState(() {

    });


  }



}
