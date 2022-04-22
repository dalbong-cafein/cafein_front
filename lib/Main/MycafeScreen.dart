import 'package:cafein_front/Main/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bottom_drawer/bottom_drawer.dart';
bool drawer = false;
List<String> cafe_names = ["커피니 상계역점", "커피니 중계점", "투썸플레이스 노원점", "스타벅스 길음점", "이디야 국민대후문점"];
BottomDrawerController controller = BottomDrawerController();
class MycafeScreen extends StatefulWidget {
  const MycafeScreen({Key? key}) : super(key: key);

  @override
  _MycafeScreenState createState() => _MycafeScreenState();
}

class _MycafeScreenState extends State<MycafeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width ;

    return Scaffold(
      appBar: AppBar(title: Text("나의 카페", style: TextStyle(color: Colors.black, fontFamily: 'MainFont', fontSize: 18),),centerTitle: true,backgroundColor: Colors.white,iconTheme: IconThemeData(
        color: Colors.black,),
        leading: IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container( height:1.0,
                    width:width,
                    color:Color(0xffEFEFEF),),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left : width * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("총 12개", style: TextStyle(fontFamily: 'MainFont', fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ),

                      Padding(

                        padding: EdgeInsets.only(left : width * 0.63),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("등록순"),
                            IconButton(
                              onPressed: (){
                                drawer = !drawer;

                                setState(() {

                                });
                                drawer ?controller.open() : controller.close();
                              },
                              icon : Icon(Icons.keyboard_arrow_down, size: 20,)
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container( height:1.0,
                    width:width,
                    color:Color(0xffEFEFEF),),
                  Padding(
                    padding: EdgeInsets.only(top : height * 0.02),
                    child: Center(
                      child: _cafelistview(height, width, true),

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top : height * 0.05),
                    child: Center(
                      child: Column(
                        children: [
                          Text("더이상 등록된 카페가 없어요",style: TextStyle(fontFamily: 'MainFont', fontWeight: FontWeight.w500),),
                          Padding(
                            padding: EdgeInsets.only(top : height * 0.008),
                            child: Text("지도에서 카페를 찾아 등록해 보세요", style: TextStyle(fontFamily: 'MainFont', fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(top : height * 0.01),
                              child: Container(
                                height: height * 0.08,
                                width: width * 0.4,
                                child: IconButton(onPressed: (){

                                },
                                    icon: Container(

                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffFC6406),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text("카페 찾아보기", style: TextStyle(fontFamily: 'MainFont', fontWeight: FontWeight.w400, color: Color(0xffFC6406)),),
                                     ),
                                    )
                                ),
                              ),
                            ),
                          ),

                        ],

                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          buildBottomDrawer(context)
        ],
      ),
    );
  }

  Widget buildBottomDrawer(BuildContext context) {
    return BottomDrawer(
      /// your customized drawer header.
      header: Container(
          decoration: BoxDecoration(
              color: Colors.transparent
          )
      ),

      /// your customized drawer body.
      body: Container(
        child: Column(
          children: [
            Text("hello"),
            Text("hi"),
          ],
        ),

      ),
      /// your customized drawer header height.
      headerHeight: 60.0,
      /// your customized drawer body height.
      drawerHeight: 180.0,
      /// drawer background color.
      color: Colors.white,
      /// drawer controller.
      controller: controller,
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

  Widget _cafelistview(double height , double width, bool open){ //TODO cafe listview
    return SizedBox( //TODO 리스트뷰에 크기를 제한하지 않으면 오류남

      //TODO cafe list * container 의 높이 + container 사이 여백 크키만큼
      //TODO cafe list가 몇개인지에 따라 리스트뷰의 높이가 달라져야 하므로
      height: cafe_names.length * 0.147 * height,
      width: width * 0.9,
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
