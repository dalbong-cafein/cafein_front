import 'dart:io';

import 'package:cafein_front/CDS/CafeinButtons.dart';
import 'package:cafein_front/CDS/CafeinColors.dart';
import 'package:cafein_front/Main/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:wechat_assets_picker/wechat_assets_picker.dart';
class ReviewScreen2 extends StatefulWidget {
  const ReviewScreen2({Key? key}) : super(key: key);

  @override
  _ReviewScreen2State createState() => _ReviewScreen2State();
}

class _ReviewScreen2State extends State<ReviewScreen2> {
  int rating_0 = 0;
  int rating_1 = 0;
  int rating_2 = 0;
  int rating_3 = 0;
  bool feeling_bad = false;
  bool feeling_soso = false;
  bool feeling_good = false;
  bool ok = false;
  late List<XFile?> images = [null, null, null, null, null];
  late List<XFile?> real_images = images.take(5).toList();

  @override
  Widget build(BuildContext context) {
    if(rating_3 != 0 && rating_2 != 0 && rating_1 != 0 && rating_0 != 0 && (feeling_good || feeling_soso || feeling_bad)){
      ok = true;
    }
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    final h_percent = height/ height_whole;
    final w_percent = width / width_whole;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size : 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("리뷰 작성하기", style: TextStyle(color : Colors.black  ,fontWeight: FontWeight.w500, fontSize: 15, fontFamily: 'MainFont'),),backgroundColor: Colors.white,),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: 296 * h_percent,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top : h_percent * 16),
                        child: Container(
                          height: 72 * w_percent,
                          width: 72 * w_percent,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(48), // Image radius
                              child: Image.network('https://googleflutter.com/sample_image.jpg', fit: BoxFit.cover),
                            ),
                          ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(top : 12 * h_percent),
                        child: Text("엔젤리너스 L7 홍대점", style: TextStyle(fontFamily: 'MainFont', fontSize:12, fontWeight: FontWeight.w400, color : Color(0xff646464) ),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top : 24 * h_percent),
                        child: Text("카공 카페로 어떤가요?", style: TextStyle(fontFamily: 'MainFont', fontSize:16, fontWeight: FontWeight.w700, color : Color(0xff333333) ),),
                      ),
                      Container(
                        width: width,
                        height: 140 * h_percent,

                        child:Padding(
                          padding: EdgeInsets.only(top : 20 * h_percent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 72 * w_percent,
                                height: 100 * h_percent,

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 72 * h_percent,
                                      width: 72 * h_percent
                                      ,child: IconButton(
                                        padding: EdgeInsets.zero, // 패딩 설정
                                        constraints: BoxConstraints(), // constraints
                                        onPressed: () {
                                          if(feeling_good){
                                            feeling_good = !feeling_good;
                                          }
                                          if(feeling_soso){
                                            feeling_soso = !feeling_soso;
                                          }
                                          feeling_bad = !feeling_bad;

                                          setState(() {

                                          });
                                        },
                                        icon: feeling_bad? Image.asset("imgs/badimg_color.png"):Image.asset("imgs/badimg.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top : 10 * h_percent),
                                      child: Text("앗, 별로에요",style: TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : feeling_bad ?Color(0xff333333) : Color(0xffACACAC) ),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 72 * w_percent,
                                height: 100 * h_percent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 72 * h_percent,
                                      width: 72 * h_percent
                                      ,child: IconButton(
                                      padding: EdgeInsets.zero, // 패딩 설정
                                      constraints: BoxConstraints(), // constraints
                                      onPressed: () {

                                        if(feeling_good){
                                          feeling_good = !feeling_good;
                                        }
                                        if(feeling_bad){
                                          feeling_bad = !feeling_bad;
                                        }
                                        feeling_soso = !feeling_soso;

                                        setState(() {


                                        });

                                      },
                                      icon: feeling_soso ? Image.asset("imgs/sosoimg_color.png"):Image.asset("imgs/sosoimg.png"),
                                    ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top : 10 * h_percent),
                                      child: Text("그저그래요",style: TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : feeling_soso ?Color(0xff333333) : Color(0xffACACAC) ),),
                                    )
                                  ],
                                ),

                              ),
                              Container(
                                width: 72 * w_percent,
                                height: 100 * h_percent,
                                child: Column(

                                  children: [
                                    Container(
                                      height: 72 * h_percent,
                                      width: 72 * h_percent
                                      ,child: IconButton(
                                      padding: EdgeInsets.zero, // 패딩 설정
                                      constraints: BoxConstraints(), // constraints
                                      onPressed: () {

                                        if(feeling_soso){
                                          feeling_soso = !feeling_soso;
                                        }
                                        if(feeling_bad){
                                          feeling_bad = !feeling_bad;
                                        }
                                        feeling_good = !feeling_good;

                                        setState(() {


                                        });

                                      },
                                      icon: feeling_good ?  Image.asset("imgs/goodimg_color.png"):Image.asset("imgs/goodimg.png"),
                                    ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top : 10 * h_percent),
                                      child: Text("추천해요",style: TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : feeling_good ?Color(0xff333333) : Color(0xffACACAC) ),),
                                    )
                                  ],
                                ),

                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top : 24 * h_percent),
                  child: Container( height:1.0,
                    width: 328 * w_percent,
                    color:Color(0xffEFEFEF),),
                ),
                Padding(
                  padding: EdgeInsets.only(top : 24 * h_percent),
                  child: Text('별점을 눌러 카페 정보를 자세히 알려주세요',style : TextStyle(fontFamily: 'MainFont', fontSize:13, fontWeight: FontWeight.w500, color : Color(0xffACACAC) ),),
                ),
                Padding(
                  padding: EdgeInsets.only(top : 24 * h_percent),
                  child: Container(

                    width: 257 * w_percent,
                    height: 228 * h_percent,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top : 7 * h_percent),
                              child: Text("와이파이", style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff333333) ),),
                            ),
                            Padding(
                              padding:EdgeInsets.only(left : 30 * w_percent),
                              child: Container(
                                width : 176 * w_percent,
                                height: 28 * h_percent,
                                child: RatingBar.builder(
                                  itemCount: 4,
                                  unratedColor: Color(0xffE3E3E3),
                                  itemBuilder: (context, _)=>Icon(Icons.star_rounded, color: Color(0xffFC7521), ),//TODO 평점 모양과 색상 설정
                                  onRatingUpdate: (rating){
                                    rating_0 = rating.toInt();
                                    setState(() {


                                    });
                                  },
                                    itemPadding: EdgeInsets.symmetric(horizontal: 3 * w_percent)
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 8 * h_percent , left: 84 * w_percent),
                          child: Container(
                              height: 12 * h_percent,
                              width: 231 * w_percent,

                              child: Text(_star(0, rating_0), style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff646464) ),)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 12 * h_percent),
                          child: Row(

                            children: [
                              Padding(
                                padding: EdgeInsets.only(top : 7 * h_percent),
                                child: Text("콘센트", style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff333333) ),),
                              ),
                              Padding(
                                padding:EdgeInsets.only(left : 43 * w_percent),
                                child: Container(
                                  width : 176 * w_percent,
                                  height: 28 * h_percent,
                                  child: RatingBar.builder(
                                      itemCount: 4,
                                      unratedColor: Color(0xffE3E3E3),
                                      itemBuilder: (context, _)=>Icon(Icons.star_rounded, color: Color(0xffFC7521), ),//TODO 평점 모양과 색상 설정
                                      onRatingUpdate: (rating){
                                        rating_1 = rating.toInt();
                                        setState(() {


                                        });

                                      },
                                      itemPadding: EdgeInsets.symmetric(horizontal: 3 * w_percent)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 8 * h_percent , left: 84 * w_percent),
                          child: Container(
                              height: 12 * h_percent,
                              width: 231 * w_percent,

                              child: Text(_star(1, rating_1) ,style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff646464) ),)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 12 * h_percent),
                          child: Row(

                            children: [
                              Padding(
                                padding: EdgeInsets.only(top : 7 * h_percent),
                                child: Text("화장실", style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff333333) ),),
                              ),
                              Padding(
                                padding:EdgeInsets.only(left : 43 * w_percent),
                                child: Container(
                                  width : 176 * w_percent,
                                  height: 28 * h_percent,
                                  child: RatingBar.builder(
                                      itemCount: 4,
                                      unratedColor: Color(0xffE3E3E3),
                                      itemBuilder: (context, _)=>Icon(Icons.star_rounded, color: Color(0xffFC7521), ),//TODO 평점 모양과 색상 설정
                                      onRatingUpdate: (rating){
                                        rating_2 = rating.toInt();
                                        setState(() {


                                        });

                                      },
                                      itemPadding: EdgeInsets.symmetric(horizontal: 3 * w_percent)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 8 * h_percent , left: 84 * w_percent),
                          child: Container(
                              height: 12 * h_percent,
                              width: 231 * w_percent,

                              child: Text(_star(2, rating_2), style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff646464) ),)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 12 * h_percent),
                          child: Row(

                            children: [
                              Padding(
                                padding: EdgeInsets.only(top : 7 * h_percent),
                                child: Text("테이블", style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff333333) ),),
                              ),
                              Padding(
                                padding:EdgeInsets.only(left : 43 * w_percent),
                                child: Container(
                                  width : 176 * w_percent,
                                  height: 28 * h_percent,
                                  child: RatingBar.builder(
                                      itemCount: 4,
                                      unratedColor: Color(0xffE3E3E3),
                                      itemBuilder: (context, _)=>Icon(Icons.star_rounded, color: Color(0xffFC7521), ),//TODO 평점 모양과 색상 설정
                                      onRatingUpdate: (rating){
                                        rating_3 = rating.toInt();
                                        setState(() {


                                        });

                                      },
                                      itemPadding: EdgeInsets.symmetric(horizontal: 3 * w_percent)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top : 8 * h_percent , left: 84 * w_percent),
                          child: Container(
                              height: 12 * h_percent,
                              width: 231 * w_percent,

                              child: Text(_star(3, rating_3), style : TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w500, color : Color(0xff646464) ),)),
                        ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top : 48 * h_percent),
                  child: Container(
                    width : 328 * w_percent,
                    height: 140 * h_percent,

                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: null,
                      maxLength: 100,
                      cursorColor: CafeinColors.orange400,
                      scrollPadding: EdgeInsets.only(bottom: height * 0.8),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color : Color(0xffACACAC))
                        ),

                        hintText: "카페의 특별한 점이나 아쉬운 점을 최소 10글자 이상 남겨주세요(선택)",
                        hintMaxLines: 2,
                        contentPadding: EdgeInsets.all(12 * w_percent),
                        hintStyle: TextStyle(fontFamily: 'MainFont', fontSize:14, fontWeight: FontWeight.w400, color : Color(0xffACACAC) ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left :26 * w_percent ),
                  child: Container(
                    height: 64 * h_percent,

                    child: Row(
                      children: [
                        Container(
                          width: 64 * w_percent,
                          height: 64 * w_percent
                          ,child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(), // constraints
                            onPressed: () {

                              _imagePicker();
                              //이미지 picker
                            },
                            icon: Container(
                                width: 64 * w_percent,
                                height: 64 * w_percent,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0,
                                  color: Color(0xffD1D1D1)
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5.0) // POINT
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top : 9 * h_percent),
                                    child: Icon(Icons.photo_camera, size : 28, color : Color(0xffACACAC)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top : 6 * h_percent),
                                    child: Container(
                                      width: 20 * w_percent,
                                      child: Row(
                                        children: [
                                          Text("5",  style : TextStyle(fontFamily: 'MainFont', fontSize:13, fontWeight: FontWeight.w400, color : CafeinColors.grey400)),
                                          Text("/5", style : TextStyle(fontFamily: 'MainFont', fontSize:13, fontWeight: FontWeight.w400, color : Color(0xffFC6406)))

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),images[0] !=null&&images.length != 0 ? _ImageList(h_percent, w_percent) : Container()
                        

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top : 31 * h_percent),
                  child: Container(
                    width : width,
                    height: 176 * h_percent,
                    color : CafeinColors.grey050,
                    child: Center(
                      child: Container(
                        height: 128 * h_percent,
                        width : 328 * w_percent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("안내 사항", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'MainFont', color: CafeinColors.grey400),),
                            Padding(
                              padding:EdgeInsets.only(top : 12 * h_percent),
                              child: Text("리뷰는 삭제 불가하며, 리뷰 작성일로부터 3일 이내에 수정할 수 있습니다.", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, fontFamily: 'MainFont', color: CafeinColors.grey400)),
                            ),
                            Text("카페인은 리뷰 검수 모니터링을 통해 부적절한 리뷰를 작성자에게 사전 안내 없이 페널티 적용과 함께 리뷰를 삭제할 수 있습니다.", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, fontFamily: 'MainFont', color: CafeinColors.grey400)),

                          ],
                        ),
                      ),
                    ),
                  ),
                )


              ],

            ),
          ),
        ],

      ),
      bottomSheet: Container(
        width : width,
        height: 75 * h_percent,
        child: Padding(
          padding: EdgeInsets.only(bottom: 14 * h_percent),
          child: Container(
            height : 52 * h_percent,
            width: 328 * w_percent,
            child: IconButton(icon: CafeinButtons.OrangeButton(52 * h_percent, 328 * w_percent, "등록하기", ok)
              ,onPressed: (){

                if(ok){

                }

              },
            ),
          ),
        ),
      ),

    );

  }


  String _star(int version, int ratings){
    if(version == 0){
      if(ratings == 1){
        return "바닥을 기어봐도 없어요";
      }if(ratings == 2){
        return "찾기 힘들어요";
      }if(ratings == 3){
        return "여유 있어요";
      }if(ratings == 4){
        return "모든 자리에 있어요";
      }
    }
    if(version == 1){
      if(ratings == 1){
        return "없어요 그냥 없어요";
      }if(ratings == 2){
        return "자주 끊겨서 화나요";
      }if(ratings == 3){
        return "그냥저냥 쓸 만해요";
      }if(ratings == 4){
        return "빵빵 잘 터져요";
      }
    }
    if(version == 2){
      if(ratings == 1){
        return "없어요 그냥 없어요";
      }if(ratings == 2){
        return "이용하기 꺼려져요";
      }if(ratings == 3){
        return "그냥저냥 쓸 만해요";
      }if(ratings == 4){
        return "화장실 맛집이에요";
      }
    }
    if(version == 3){
      if(ratings == 1){
        return "카공을 허락하지 않아요";
      }if(ratings == 2){
        return "오래 쓰면 몸이 아파요";
      }if(ratings == 3){
        return "그냥저냥 쓸 만해요";
      }if(ratings == 4){
        return "매우 편하게 사용 가능해요";
      }
    }

    return " ";
  }

  Widget _ImageListOne(double h_percent, double w_percent, int index){
    return Padding(
      padding: EdgeInsets.only(left : 8 * h_percent),
      child: Container(
        height: 64 * h_percent,
        width : 64 * h_percent,
        child: Stack(
          children: [
            Container(
              height: 64 * h_percent,
              width: 64 * h_percent,

              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CafeinColors.grey300
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(8.0) // POINT
                  ),
                    image: DecorationImage(
                        fit : BoxFit.fitWidth,
                        image: FileImage(File(images[index]!.path))
                    )
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left :38 * h_percent, bottom : 38 * h_percent, top : 2 * h_percent, right : 2 * h_percent  ),
              child: Container(
                width: 24 * h_percent,
                height: 24 * h_percent,

                child: IconButton(
                  padding: EdgeInsets.zero, // 패딩 설정
                  constraints: BoxConstraints(), // constraints
                  onPressed: () {
                    _imageDelete(index);
                  },
                  icon: Image.asset("imgs/cancelimg.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _ImageList(double h_percent, double w_percent){
    return SizedBox(
        height: 64 * h_percent,
        width : 280 * w_percent,

        child : ListView.builder(

          itemCount: images.length,
            scrollDirection: Axis.horizontal
            ,itemBuilder: (BuildContext context , int index) {
          return _ImageListOne(h_percent, w_percent, index) ;
        })
    );
  }

  Future<void> _imagePicker() async {
    //result = await AssetPicker.pickAssets(context);
    final ImagePicker _picker = ImagePicker();
    images = (await _picker.pickMultiImage())!;
    if(images.length > 5){ //이미지 개수 5 개로 제한
      for(int i =4 ; i < images.length ; i++){
        images.removeAt(i);
      }
    }

    setState(() {

    });
  }
  void _imageDelete(int deletepos){


    setState(() {
      if(deletepos ==0 && images.length == 1){
        images = [null, null, null, null, null];
      }else{
        images.removeAt(deletepos);
      }

    });
  }

  Future<bool> _imageWidthHeight(File image) async {
    var decodedImage = await decodeImageFromList(image.readAsBytesSync());
    if(decodedImage.width > decodedImage.height){
      return true;
    }else{
      return false;
    }
  }

}