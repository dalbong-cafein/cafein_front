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
          ),
          Padding(padding: EdgeInsets.only(top : height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffFFF0E6),
                  ),
                  width: width * 0.43,
                  height: height * 0.08,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.03),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.05,
                              width: height * 0.05,
                              child: Image.asset("imgs/stamp_icon_image.png"),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("스탬프", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.085, right: width * 0.01),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color : Color(0xffFC6406)))
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffFFF0E6),
                  ),
                  width: width * 0.43,
                  height: height * 0.08,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.03),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.05,
                              width: height * 0.05,
                              child: Image.asset("imgs/cupon_icon_img.png"),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("쿠폰", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.12, right: width * 0.01),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color : Color(0xffFC6406)))
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left : width * 0.05, top : height * 0.05, bottom: height * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("나의 카페", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
              ],
            ),
          ),
          _cafelistview(height, width)

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
  Widget _cafelistview(double height , double width){ //TODO cafe listview
    return SizedBox( //TODO 리스트뷰에 크기를 제한하지 않으면 오류남
      width: width,
      height: height * 0.3,
      child: ListView.builder(
          itemBuilder: (BuildContext context , int index){
            return Padding(
              padding: EdgeInsets.only(top : height * 0.003),
              child: Center(
                child: Container(
                  height: height * 0.1,
                  width: width * 0.8,

                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffD1D1D1),
                        width: 1,
                      ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            );
          }
      ),
    );
  }


}
