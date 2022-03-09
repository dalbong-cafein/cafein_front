import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MapScreen.dart';

class MapSearchScreen extends StatefulWidget {

  const MapSearchScreen({Key? key}) : super(key: key);

  @override
  _MapSearchScreenState createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;


    return Scaffold(
      body:SafeArea(
        child: Row(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(

              children: [
                IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  );

                }, icon: Icon(Icons.arrow_back_ios)),

                Container(

                  width: width * 0.8,
                  height: height * 0.06,
                  child: TextField(
                    onChanged:(text){setState(() {
                      //검색시
                    });}
                    ,
                    onSubmitted: (text){setState(() {
                      //작성 완료 시
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


    );
  }
}
