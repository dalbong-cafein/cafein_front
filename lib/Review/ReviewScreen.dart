import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
int rating_c = 0;
int rating_r = 0;
int rating_t = 0;
int rating_w = 0;
bool sad = false;
bool soso = false;
bool good = false;
bool ok = false;
late ScrollController _scrollController;
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}


class _ReviewScreenState extends State<ReviewScreen> {

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }



  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    if((soso == true || sad == true || good == true) && (rating_t >0 || rating_r >0 || rating_w >0 || rating_c >0)){
      ok = true;
    }

    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("리뷰 작성하기"),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        leading: Icon(Icons.arrow_back_ios, color: Colors.black,),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top : height * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                        width: width * 0.2,
                        height: width * 0.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48),
                            child: Image.asset("imgs/appimg.png"),
                          ),
                        )
                      )

                    ],
                  ),
                ),

                Padding(
                  padding:EdgeInsets.only(top : height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "엔젤리너스 홍대점",
                        style: TextStyle(color: Color(0xff646464) , fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top : height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "카공 카페로 추천하시겠어요?",
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top : height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Container(
                        width: width * 0.33,
                        height: height * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width : width * 0.2,
                              height: height * 0.2,
                              child: IconButton(onPressed: (){setState(() {
                                sad = true;
                                if(soso == true){
                                  soso = false;
                                }
                                if(good = true){
                                  good = false;
                                }

                              });}, icon: Image.asset(sad ? "imgs/review_sad_color_image.png":"imgs/review_sad_nocolor_image.png",)),
                            ),
                            Text("별로에요",  style: TextStyle(color : sad ? Colors.black : Color(0xffE0E0E0)))
                          ],
                        ),
                      ),
                    Container(
                      width: width * 0.33,
                      height: height * 0.25,
                      child: Column(
                        children: [
                          Container(
                            width : width * 0.2,
                            height: height * 0.2,
                            child: IconButton(onPressed: (){setState(() {
                              soso =true;
                              if(good == true){
                                good = false;
                              }
                              if(sad == true){
                                sad = false;
                              }

                            });}, icon: Image.asset(soso ? "imgs/review_soso_color_image.png":"imgs/review_soso_nocolor_image.png", )),
                          ),
                          Text("그저그래요", style: TextStyle(color : soso ? Colors.black : Color(0xffE0E0E0)),)
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.33,
                      height: height * 0.25,
                      child: Column(
                        children: [
                          Container(
                            width : width * 0.2,
                            height: height * 0.2,
                            child: IconButton(onPressed: (){setState(() {
                              good =true;
                              if(soso == true){
                                soso = false;
                              }
                              if(sad == true){
                                sad = false;
                              }

                            });}, icon: Image.asset(good ? "imgs/review_good_color_image.png":"imgs/review_good_nocolor_image.png", )),
                          ),
                          Text("좋아요", style: TextStyle(color : good ? Colors.black : Color(0xffE0E0E0)))
                        ],
                      ),
                    )
                  ],
                ),

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container( height:1.0,
                    width:width * 0.8,
                    color:Color(0xffEFEFEF),),
                ),
                Padding(
                    padding: EdgeInsets.only(top : height * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("카페에 대한 상세한 평가를 해주세요", style: TextStyle(color: Color(0xffACACAC), fontSize: 15),)
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top : height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("콘센트" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    RatingBar.builder(
                      itemCount: 4, //별 4개
                      allowHalfRating: true, //별점 0.5 가능
                      itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,),//평점 모양과 색상 설정
                      onRatingUpdate: (rating){
                        setState(() {
                          rating_c = rating.toInt(); //rating이 업데이트 될때마다 변수에 저장
                        });

                      },
                    ),

                  ],
                ),
                ),
                Padding(
                  padding:EdgeInsets.only(top : height * 0.003, left: width * 0.45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        rating_c < 2 ? "50% 미만 좌석에서 사용할 수 있어요" : "50% 이상 좌석에서 사용할 수 있어요",
                        //평점이 절반 미만이면 부정텍스트 , 절반 이상이면 긍정 텍스트
                        style: TextStyle( fontSize: 13, ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top : height* 0.005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Spacer(flex: 4), //와이파이는 4글자라서 다른 항목들과 줄을 맞춰주기 위함
                      Text("와이파이" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Spacer(flex: 3), //Spacer -> children 간 간격을 flex 비율로 떨어뜨려준다.
                      RatingBar.builder(
                        allowHalfRating: true,
                        itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,),
                        itemCount: 4,
                        onRatingUpdate: (rating){
                          setState(() {
                            rating_w = rating.toInt();
                          });
                        },
                      ),
                      Spacer(flex: 4),
                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(top : height * 0.005, left: width * 0.45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        rating_w < 2 ? "느려요" : "빵빵 터져요!",
                        style: TextStyle( fontSize: 13, ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top : height * 0.005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("화장실" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      RatingBar.builder(
                        allowHalfRating: true,
                        itemCount: 4,
                        itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,),
                        onRatingUpdate: (rating){
                          setState(() {
                            rating_r = rating.toInt();
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(top : height * 0.005, left: width * 0.45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        rating_r < 2 ? "가고 싶지 않아요" : "깨끗해요",
                        style: TextStyle( fontSize: 13, ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top : height * 0.005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("테이블" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      RatingBar.builder(
                        allowHalfRating: true,
                        itemCount: 4,
                        itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,),
                        onRatingUpdate: (rating){
                          setState(() {
                            rating_t = rating.toInt();
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(top : height * 0.005, left: width * 0.45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        rating_t < 2 ? "좁아요" : "여유로워요",
                        style: TextStyle( fontSize: 13, ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top : height * 0.03, left: width * 0.03, right: width * 0.03, bottom: height * 0.2),
                  child: TextField(
                    maxLength: 100,
                    scrollPadding: EdgeInsets.only(bottom:height * 0.8),
                    minLines: 2,
                    maxLines: 10,  // allow user to enter 5 line in textfield
                    keyboardType: TextInputType.multiline,
                    cursorColor: Color.fromRGBO(252, 99, 6, 1.0),
                    decoration: InputDecoration(
                      hintText: "사진과 함께 카페의 특별한 점이나 아쉬운 점을 남겨주세요(선택)",
                      hintStyle: TextStyle(color: Colors.grey),
                      counterStyle: TextStyle(color : Colors.blue),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 1, color: Colors.grey)
                      ),
                    ),// user keyboard will have a button to move cursor to next line

                  ),
                ),
                Container(
                  width:  width,
                  height: height * 0.8,
                  color: Color(0xffF6F6F6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top : height * 0.015),
                            child: Text("작성된 리뷰는 3일동안 수정 가능합니다" , style: TextStyle(color : Color(0xffACACAC), fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    ],
                  ),
                )


              ],
              
            ),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: width,
                height: height * 0.095,
                color: Colors.white,
              )
            ],
          )

        ],

      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: height * 0.01,),
              child: Container(

                width: width * 0.95,
                height: height * 0.07,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(ok ? Color.fromRGBO(252, 99, 6, 1.0) : Color(0xffEFEFEF)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: ok ? Color.fromRGBO(252, 99, 6, 1.0) : Color(0xffEFEFEF))
                            )
                        )
                    ),
                  onPressed: () {
                  },
                  child: Text("완료"),
                ),
              ),
            ),

          ),
        ],
      ),

    );
  }
}
