import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0 ; //TODO like fragment

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomnavigation(),
      body: IndexedStack(
        index: currentIndex, //TODO 바텀네비게이션뷰 선택하면 숫자 바뀌도록함
       children: [
          _MainWidget(),
          _MainWidget2(),
          _MainWidget3(),
          _MainWidget4()
        ],

      ),

    );
  }


  Widget _bottomnavigation(){
    return BottomNavigationBar(
      fixedColor: Colors.black,
      currentIndex: currentIndex,
      showSelectedLabels: false, //TODO 아이콘만 보이도록
      showUnselectedLabels: false,
      onTap: onTabTapped,
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
  //TODO 클릭된 메뉴 index 반영
  void onTabTapped(int index) { setState(() { currentIndex = index; }); }


  Widget _MainWidget(){
    return Container(
      
      child: Text("1"),
    );
  }
  Widget _MainWidget2(){
    return Container(
      child: Text("2"),
    );
  }
  Widget _MainWidget3(){
    return Container(
      child: Text("3"),
    );
  }
  Widget _MainWidget4(){
    return Container(
      child: Text("4"),
    );
  }


}
