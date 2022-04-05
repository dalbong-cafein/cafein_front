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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      bottomNavigationBar: _bottomnavigation(),
      body: IndexedStack(
        index: currentIndex, //TODO 바텀네비게이션뷰 선택하면 숫자 바뀌도록함
       children: [
          _MainWidget(height , width),
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
      unselectedItemColor: Color(0xffACACAC),
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
          icon : Icon(Icons.search),
            label: "hello"
        ),
        BottomNavigationBarItem(
          icon : Icon(Icons.notifications),
            label: "hello"
        ),
        BottomNavigationBarItem(
          icon : Icon(Icons.more_horiz),
            label: "hello"
        ),

      ],


    );

  }
  //TODO 클릭된 메뉴 index 반영
  void onTabTapped(int index) { setState(() { currentIndex = index; }); }


  Widget _MainWidget(double height , double width){
    return Scaffold(
      appBar: AppBar(title: Text("Cafein", style: TextStyle(color: Color(0xffACACAC)),),backgroundColor: Colors.white,),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: Row(
              children: [
                Container(
                  width: width * 0.15,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("imgs/appimg.png")
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top : height * 0.01, bottom: height * 0.02, left: width * 0.05),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: height * 0.01),
                        child: Row(
                          children: [
                            Text("카페인", style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold ),),
                            Icon(Icons.chevron_right, color: Color(0xffACACAC),)
                          ],
                        ),
                      ),
                      Text("카페인 1 일차", style: TextStyle(color: Color(0xffACACAC),fontWeight: FontWeight.normal),)
                    ],
                  ),
                )


              ],
            ),
          )
        ],

      )
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
