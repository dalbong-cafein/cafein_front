import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
int rating_c = 0;
int rating_r = 0;
int rating_t = 0;
int rating_w = 0;
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                        style: TextStyle(color: Colors.grey , fontSize: 12, fontWeight: FontWeight.w600),
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
                Padding(
                    padding: EdgeInsets.only(top : height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("카페에 대한 상세한 평가를 해주세요", style: TextStyle(color: Colors.grey, fontSize: 15),)
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top : height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Text("콘센트" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                    RatingBar.builder(
                      allowHalfRating: true,
                      itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,),
                      onRatingUpdate: (rating){
                        setState(() {
                          rating_c = rating.toInt();
                        });

                      },
                    ),

                  ],
                ),
                ),
                Padding(
                  padding:EdgeInsets.only(top : height * 0.003, left: width * 0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        rating_c <= 2.5 ? "50% 미만 좌석에서 사용할 수 있어요" : "50% 이상 좌석에서 사용할 수 있어요",
                        style: TextStyle( fontSize: 13, ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top : height* 0.005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Spacer(flex: 4),
                      Text("와이파이" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Spacer(flex: 3),
                      RatingBar.builder(
                        allowHalfRating: true,
                        itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,),
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
                  padding:EdgeInsets.only(top : height * 0.005, left: width * 0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        rating_w <= 2.5 ? "느려요" : "빵빵 터져요!",
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
                  padding:EdgeInsets.only(top : height * 0.005, left: width * 0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        rating_r <= 2.5 ? "가고 싶지 않아요" : "깨끗해요",
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
                  padding:EdgeInsets.only(top : height * 0.005, left: width * 0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        rating_t <= 2.5 ? "좁아요" : "여유로워요",
                        style: TextStyle( fontSize: 13, ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top : height * 0.5, bottom: height * 0.5),
                  child: TextField(
                    minLines: 2,
                    maxLines: 10,  // allow user to enter 5 line in textfield
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular((10)))
                      )
                    ),// user keyboard will have a button to move cursor to next line

                  ),
                ),

              ],
              
            ),

          ),

        ],

      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + height*0.01),
              child: Container(

                width: width ,
                height: height * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary:  const Color(0xffD1D1D1),
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
