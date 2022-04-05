import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomnavigation(),
      body: Container(),

    );
  }


  Widget _bottomnavigation(){
    return BottomNavigationBar(
      fixedColor: Colors.black,
      currentIndex: 1,
      showSelectedLabels: false, //TODO 아이콘만 보이도록
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon : Icon(Icons.home),
          label: "hello"
        ),
        BottomNavigationBarItem(
          icon : Icon(Icons.home),
            label: "hello"
        ),
        BottomNavigationBarItem(
          icon : Icon(Icons.home),
            label: "hello"
        ),
        BottomNavigationBarItem(
          icon : Icon(Icons.home),
            label: "hello"
        ),

      ],


    );

  }


}
