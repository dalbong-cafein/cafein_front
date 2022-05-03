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
            child: Center(child: Text("hello")),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.black,
                width: width,
                height: height * 0.1,
                child:Row(
                  children: [
                    Icon(Icons.arrow_back_ios),
                    TextField(
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
