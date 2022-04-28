import 'package:cafein_front/Main/MycafeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  final String token;
  const MainScreen(this.token);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0 ; //TODO like fragment
  List<int> cafe_list = [1, 1, 1, 1, 1];
  List<bool> favs = [false, false, false , false, false, false, false, false, false, false];
  List<String> cafe_names = ["커피니 상계역점", "커피니 중계점", "투썸플레이스 노원점", "스타벅스 길음점", "이디야 국민대후문점"];


  @override
  Widget build(BuildContext context) {
      
    _roadProfile();
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

  Future<void> _roadProfile() async {
    print("token으로 프로필 로드 시작 , token :" + widget.token);
    var url = Uri.parse("https://api.cafeinofficial.com/members/info");
    var accesstoken = widget.token;
    var response = await http.get(url , headers: {"cookie" : "accessToken=$accesstoken"});
    print("프로필 로드 완료 ---------- " + response.body.toString());
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
      appBar: AppBar(title: Text("cafein", style: TextStyle(color: Color(0xffACACAC), fontFamily: 'TitleFont_Eng', fontWeight: FontWeight.w700, fontSize: 30),),backgroundColor: Colors.white,centerTitle: false,),
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
            _cafelistview(height, width, true), //TODO 카페 리스트 뷰
            Padding(
              padding: EdgeInsets.only(top : height * 0.007),
              //TODO 내 카페가 5 개 이하일때는 모두보기 버튼을 없앤다.
              child: cafe_list.length < 5? Container() : Container(
                child: IconButton(
                  icon: Center(
                    child: Text("나의 카페 모두 보기", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  ), onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MycafeScreen()),
                  );

                },
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
            ),
            Padding(
              padding: EdgeInsets.only(top : height * 0.03),
              child: Center(
                child: Container(
                    width: width * 0.87,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                        color: Color(0xffFFF0F3),
                        borderRadius: BorderRadius.circular(7)
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left : width * 0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("친구 초대하고 쿠폰 받자", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left : width * 0.55, top : height * 0.01),
                          child: Icon(Icons.person,color :Color(0xffFC7521), size : 50),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left : width * 0.66, top : height * 0.03),
                          child: Container(
                            height: height * 0.07,
                            width: height * 0.07,
                            child: Image.asset("imgs/cupon_adv_img.png"),
                          ),
                        ),

                      ],
                  ),
                ),
              ),
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


  Widget _storeOpen(double myheight, double mywidth, bool open){ //TODO 영업중 표시
    return Container(

      child: Padding(
        padding: EdgeInsets.only(top : myheight * 0.1, bottom: myheight * 0.1 , left: mywidth * 0.2, right:  mywidth * 0.2),
        child: Center(child: Text(open ? "영업중" : "영업 종료", style: TextStyle(color: open ? Color(0xff646464) : Color(0xffD1D1D1)),)),
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
    print("listview 다시 빌드됨");
    return SizedBox(
      height: width * 0.6,
      width: width * 5.30,
      child: ListView(

        scrollDirection: Axis.horizontal,
        children: [
          _cafeinPickedCafe(height, width, 0, true, 0),
          _cafeinPickedCafe(height, width, 1, false, 1),
          _cafeinPickedCafe(height, width, 2, true, 2),
          _cafeinPickedCafe(height, width, 0, true , 3),
          _cafeinPickedCafe(height, width, 1, true, 4),
          _cafeinPickedCafe(height, width, 2, false, 5),
          _cafeinPickedCafe(height, width, 0, false, 6),
          _cafeinPickedCafe(height, width, 1, false, 7),
          _cafeinPickedCafe(height, width, 2, false, 9),


        ],
      ),
    );
  }//TODO 카페인픽 가로 리스트 (추천 카페)


  Widget _cafeinPickedCafe(double height , double width, int status, bool open,int fav_int){//TODO 전체 Height, width /가게 혼잡도 / 오픈여부
    print("called - cafeinPickedCafe");

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
                                padding: EdgeInsets.only(left: width * 0.01, right: width * 0.2),
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
                          padding: EdgeInsets.only(top : height * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.near_me, size: 18,),
                              Text("10m", style: TextStyle(color : Color(0xff646464), fontSize: 15),),

                              Padding(
                                padding: EdgeInsets.only(left : width * 0.015),
                                child: Icon(Icons.star, size : 20, color: Color(0xffFFC222),),
                              ),
                              Text("4.5",style: TextStyle(color : Color(0xff646464), fontSize: 15),),

                              Padding(
                                padding: EdgeInsets.only(left : width * 0.015),
                                child: Icon(Icons.favorite, size : 18, color : Color(0xffFC6406)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.005),
                                child: Text("3,847", style: TextStyle(color : Color(0xff646464), fontSize: 15),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.008),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed:(){

                    setState(() {
                      //TODO setState 할때마다 listview가 다시 빌드되어 하트 색깔이 고정되는 문제가 있어서 favs를 전역변수로 생성하고 하트 색을 true false로 관리한다.
                      favs[fav_int]= !favs[fav_int]; //TODO 하트 껐다 켰다 가능
                    });
                  }, icon: favs[fav_int] ? Icon(Icons.favorite, color : Color(0xffFC6406))  : Icon(Icons.favorite_border, color: Colors.white,))
                ],
              ),
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
      height: cafe_names.length * 0.147 * height,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),//TODO 스크롤을 내릴수 없도록
          itemCount: cafe_names.length, //TODO cafe list 수로 제한
          itemBuilder: (BuildContext context , int index){
            return Padding(
              padding: EdgeInsets.only(top : height * 0.007),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cafe_names[index], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                ],
                              ),
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
                                  open ? Text(" 카공족 0명이 카페에 있어요") : Container()
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
            );
          }
      ),
    );
  } //TODO 카페 리스트뷰


}
