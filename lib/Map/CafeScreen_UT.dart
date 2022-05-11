import 'package:cafein_front/Main/MainScreen.dart';
import 'package:cafein_front/Review/ReviewScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CafeScreen_UT extends StatefulWidget {
  final String token;
  final String name;
  const CafeScreen_UT(this.token, this.name);



  @override
  _CafeScreen_UTState createState() => _CafeScreen_UTState();
}

class _CafeScreen_UTState extends State<CafeScreen_UT> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("imgs/utimg.png"),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top : 254 * height/ height_whole),
                  child: Center(child: Text(widget.name, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500, fontFamily: 'MainFont'),)),
                ),
                Padding(
                  padding: EdgeInsets.only(top : 820 * height/ height_whole),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Opacity(
                        opacity: 0
                        ,child: Container(
                          width : width * 0.5,
                          height: height * 0.05,

                          child: IconButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ReviewScreen(widget.token , widget.name)),
                            );

                          }, icon:
                            Container(
                              color : Colors.grey,

                            ),
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
