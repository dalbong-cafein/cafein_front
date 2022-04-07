import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0 ; //TODO like fragment
  List<int> cafe_list = [1, 1, 1, 1, 1];



  @override
  Widget build(BuildContext context) {

    print(cafe_list.length.toString());
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
      body: SingleChildScrollView(
        child: Column(
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
            Padding(padding: EdgeInsets.only(top : height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffFFF0E6),
                    ),
                    width: width * 0.46,
                    height: height * 0.08,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
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
                    width: width * 0.46,
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
            _cafelistview(height, width, false), //TODO 카페 리스트 뷰
            Padding(
              padding: EdgeInsets.only(top : height * 0.007),
              //TODO 내 카페가 5 개 이하일때는 모두보기 버튼을 없앤다.
              child: cafe_list.length < 5? Container() : Container(
                child: Center(
                  child: Text("나의 카페 모두 보기", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                ),
                height: height * 0.06,
                width: width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD1D1D1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : width * 0.05, top : height * 0.05, bottom: height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("카페인's PICK", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left : width * 0.03),
              child: _rowCafeListview(height, width),
            )

          ],

        ),
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


  Widget _storeOpen(double myheight, double mywidth, bool open ){ //TODO 영업중 표시
    return Container(

      child: Padding(
        padding: EdgeInsets.only(top : myheight * 0.1, bottom: myheight * 0.1 , left: mywidth * 0.2, right:  mywidth * 0.2),
        child: Text(open ? "영업중" : "영업 종료", style: TextStyle(color: open ? Color(0xff646464) : Color(0xffD1D1D1)),),
      ),
        decoration: BoxDecoration(
        border: Border.all(
        color: Color(0xffD1D1D1),
        width: 1,
      ), borderRadius: BorderRadius.circular(5)
        )

    );
  } //TODO open 여부 Container

  Widget _storeStatus(double myheight, double mywidth, int status){ //TODO 영업중 표시, 혼잡도 상태를 int(0,1,2)로 받음
    var status_string;
    var status_color;
    var status_backcolor;
    if(status == 0){
      status_backcolor = Color(0xffDFF5E8);
      status_color = Color(0xff26BA6A);
      status_string = "여유";
    }
    if(status == 1){
      status_backcolor = Color(0xffFFF3E0);
      status_color = Color(0xffFF9800);
      status_string = "보통";
    }
    if(status == 2){
      status_backcolor = Color(0xffFFEBEE);
      status_color = Color(0xffF44336);
      status_string = "혼잡";
    }
    return Container(

        child: Padding(
          padding: EdgeInsets.only(top : myheight * 0.1, bottom:  myheight * 0.1 , left: mywidth * 0.2, right:  mywidth * 0.2),
          child: Text(status_string, style: TextStyle(color: status_color),),
        ),
        decoration: BoxDecoration(
          color: status_backcolor,
            border: Border.all(
              color: status_backcolor,
              width: 1,
            ), borderRadius: BorderRadius.circular(5)
        )

    );
  } //TODO 혼잡도 표시 Container

  Widget _rowCafeListview(double height , double width){//TODO 카페 리스트뷰
    return SizedBox(
      height: width * 0.6,
      width: width * 5.30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _cafeinPickedCafe(height, width, 0, true),
          _cafeinPickedCafe(height, width, 1, false),
          _cafeinPickedCafe(height, width, 2, false),
          _cafeinPickedCafe(height, width, 0, false),
          _cafeinPickedCafe(height, width, 1, false),
          _cafeinPickedCafe(height, width, 2, false),
          _cafeinPickedCafe(height, width, 0, false),
          _cafeinPickedCafe(height, width, 1, false),
          _cafeinPickedCafe(height, width, 2, false),


        ],
      ),
    );
  }//TODO 카페인픽 가로 리스트 (추천 카페)

  Widget _cafeinPickedCafe(double height , double width, int status, bool open){//TODO 전체 Height, width /가게 혼잡도 / 오픈여부
    return Padding(
      padding: EdgeInsets.only(left : width * 0.02),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffD1D1D1),
              width: 1,
            ), borderRadius: BorderRadius.circular(8)
        ),
        width: width * 0.5,
        height: width * 0.5 * 10/9,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("imgs/cafe_img.png", fit : BoxFit.fitWidth)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(

                  height: width * 0.5 * 10/9 * 0.6,
                  child: Padding(
                    padding: EdgeInsets.only(left : width * 0.03, top :width * 0.5 * 10/9 * 0.6 *0.05 ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("투썸플레이스 합정점", style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(top : height * 0.01),
                          child: open ? Row( //TODO 가게가 열었으면 열음 + 혼잡도 / 아니면 열지않음만 표시
                            children: [
                              _storeOpen(height * 0.01, width * 0.1, true),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.01, right: width * 0.21),
                                child: _storeStatus(height*0.01, width * 0.08, status),
                              ),
                            ],
                          ) : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _storeOpen(height * 0.01, width * 0.1, false),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : height * 0.075),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.near_me, size: 18,),
                              Text("10m", style: TextStyle(color : Color(0xff646464), fontSize: 17),),

                              Padding(
                                padding: EdgeInsets.only(left : width * 0.015),
                                child: Icon(Icons.star, size : 20, color: Color(0xffFFC222),),
                              ),
                              Text("4.5",style: TextStyle(color : Color(0xff646464), fontSize: 17),),

                              Padding(
                                padding: EdgeInsets.only(left : width * 0.015),
                                child: Icon(Icons.favorite, size : 18, color : Color(0xffFC6406)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.005),
                                child: Text("3,847", style: TextStyle(color : Color(0xff646464), fontSize: 17),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  } //TODO 카페인픽 리스트 요소들


  Widget _cafelistview(double height , double width, bool open){ //TODO cafe listview
    return SizedBox( //TODO 리스트뷰에 크기를 제한하지 않으면 오류남

      width: width * 0.9,
      //TODO cafe list * container 의 높이 + container 사이 여백 크키만큼
      //TODO cafe list가 몇개인지에 따라 리스트뷰의 높이가 달라져야 하므로
      height: cafe_list.length * 0.147 * height,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),//TODO 스크롤을 내릴수 없도록
          itemCount: cafe_list.length, //TODO cafe list 수로 제한
          itemBuilder: (BuildContext context , int index){
            return Padding(
              padding: EdgeInsets.only(top : height * 0.007),
              child: Center(
                child: Container(
                  height: height * 0.14,
                  width: width * 0.9,

                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffD1D1D1),
                        width: 1,
                      ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            height: height * 0.15 * 0.8, //TODO 상위 컨테니너의 80 프로 정도 차지
                            width: height * 0.15 * 0.8,
                            child: Image.asset("imgs/twosome_img.png"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("투썸플레이스 메세나 폴리스점", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                open? Row( //TODO 열었으면 오픈 + 혼잡도 표시 아니면 영업 종료만 띄우기
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _storeOpen(height * 0.01, width * 0.1, true),
                                    Padding(
                                      padding: EdgeInsets.only(left: width * 0.01, right: width * 0.21),
                                      child: _storeStatus(height*0.01, width * 0.08, 1),
                                    ),
                                  ],
                                ) : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: width * 0.275),
                                      child: _storeOpen(height * 0.01, width * 0.1, false),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.person,color: Color(0xffFC6406),size: 23,),
                                    Text(" 카공족 0명이 카페에 있어요")
                                  ],
                                )
                              ],

                            ),
                          )
                        ],
                        
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  } //TODO 카페 리스트뷰


}
