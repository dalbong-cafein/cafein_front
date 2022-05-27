import 'package:cafein_front/CDS/CafeinStoreStatus.dart';
import 'package:flutter/cupertino.dart';

import 'MainScreen.dart';

class MyCafeSreen extends StatefulWidget {
  const MyCafeSreen({Key? key}) : super(key: key);

  @override
  _MyCafeSreenState createState() => _MyCafeSreenState();
}

class _MyCafeSreenState extends State<MyCafeSreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/height_whole;
    final w_percent = width/ width_whole;
    return Container();
  }

  
}
