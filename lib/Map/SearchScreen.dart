import 'package:cafein_front/Main/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top : height * 89/ height_whole),
                  child: Center(
                    child: Container( height:1.0,
                      width:width ,
                      color:Color(0xffEFEFEF),),
                  ),
                ),
              ],
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(

                width: width,
                height: height * 56 / width_whole,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 10 / width_whole, right: width * 20 / width_whole),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    Container(
                      height: 44 * height / height_whole,
                      width: width * 307 / width_whole,
                      child: Center(
                        child: TextField(
                          onChanged: (text){

                          },
                          autofocus: true,
                          cursorColor: Color(0xffFC6406),
                          decoration: InputDecoration(
                            hintText:"카페이름, 구, 동, 역 등으로 검색" ,
                            filled: true,
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
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
