import 'package:cafein_front/Review/ReviewScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Main/MainScreen.dart';

class ReviewfinishedScreen extends StatefulWidget {
  final String token;
  const ReviewfinishedScreen(this.token);

  @override
  _ReviewfinishedScreenState createState() => _ReviewfinishedScreenState();
}

class _ReviewfinishedScreenState extends State<ReviewfinishedScreen> {


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(icon : Icon(Icons.arrow_back_ios), color: Colors.black, onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewScreen(widget.token)),
              );
            });
          },),
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(bottom: height * 0.05,),
                child: Container(

                  width: width * 0.95,
                  height: height * 0.07,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(252, 99, 6, 1.0)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),

                            )
                        )
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen(widget.token)),
                      );
                    },
                    child: Text("홈으로"),
                  ),
                ),
              ),

            ),
          ],
        ),
      );

  }


}

