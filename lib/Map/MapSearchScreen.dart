import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body:SafeArea(
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
                      //검색시
                    });}
                    ,


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
