

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cafein_front/Login/LoginScreen.dart';
import 'package:cafein_front/Login/PhoneScreen.dart';
import 'package:cafein_front/Main/MainScreen.dart';
import 'package:cafein_front/Main/TestScreen.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';

String profileimg = " ";
bool first_load = true;
bool image_plus = false;
XFile? image;

final myController = TextEditingController();
String nickname = myController.text; //입력받은 닉네임
bool nickname_correct = false;
String nick =" ";
var img_id;
class RegisterScreen extends StatefulWidget {
  //TODO 전 화면에서 token 받기
  final String token;
  const RegisterScreen(this.token);
  //RegisterScreen({Key? key, required this.token }) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}




class _RegisterScreenState extends State<RegisterScreen> {

  int imgsize_width = 0;
  int imgsize_height = 0;
  bool textin = false;
  int errortype = 0;
  Widget errormessage = Container();

  @override
  Widget build(BuildContext context) {
    _roadProfile();
    print("RegisterScreen ---- build  : " + widget.token);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final randomint = Random().nextInt(3);
    print(MediaQuery.of(context).viewInsets.bottom.toString());
    if(image != null){
      print('image slected');
      image_plus = true;
    }
    if(first_load){
      if(randomint == 0){
        profileimg = "imgs/randomimg1.png";
      }
      if(randomint == 1){
        profileimg = "imgs/randomimg2.png";
      }
      else{
        profileimg = "imgs/randomimg3.png";
      }
      first_load = false;
    }

    return Scaffold(
      resizeToAvoidBottomInset : false,

      appBar: AppBar(
        elevation: 0.0,
        title: Text("프로필 설정", style: TextStyle(fontSize: 15, fontFamily: 'MainFont', fontWeight: FontWeight.w500, color: Color(0xff333333)),),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff333333) , size :24),
          onPressed: () => Navigator.pop(context),
        ),


      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.3,
            width: height * 0.3,
            child: IconButton(onPressed: (){
              print("icon piont");
              _imagepicker();


            }, icon: image_plus ? Container(

              width: width *0.3,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  image: DecorationImage(
                      fit : imgsize_width < imgsize_height ? BoxFit.fitWidth : BoxFit.fitHeight,
                      image: FileImage(File(image!.path)),
                  )
              ),
            ):Image.asset(profileimg, fit: BoxFit.fill,)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                height: 56 * height / height_whole,
                width: width * 0.8,
                child: TextField(

                  onChanged: (text){
                    textin = true;
                    if(text.substring(text.length-1 , text.length) == ' '){//TODO 공백 입력 막기
                      myController.text = text.substring(0 , text.length -1);
                      myController.selection = TextSelection.fromPosition(TextPosition(offset: myController.text.length));
                    }

                    setState(() {
                      if(text.contains('₩')||text.contains('\$')||text.contains('\\')||text.contains('"')||text.contains("'")||text.contains('ㅡ')||text.contains('!')|| text.contains('@')|| text.contains('#')|| text.contains('~')|| text.contains('`')|| text.contains('%')|| text.contains('^')|| text.contains('&')|| text.contains('*')|| text.contains('(')|| text.contains(')')|| text.contains('-')|| text.contains('_')|| text.contains('=')|| text.contains('+')|| text.contains('[')|| text.contains(']')|| text.contains('{')|| text.contains('}')|| text.contains('|')|| text.contains(';')|| text.contains(':')|| text.contains('/')|| text.contains('?')|| text.contains('>')|| text.contains('.')|| text.contains('<')|| text.contains(',')|| text.contains('"')|| text.contains("'") ){
                        nickname_correct = false;
                      }
                      else{
                        nickname_correct = true;
                        nick = text;
                      }
                      errormessage = _examString(text);
                    });
                  },

                  cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                  controller: myController,
                  decoration: InputDecoration(

                    suffixIcon: textin ? IconButton(icon : Icon(Icons.cancel, color : Color(0xffD1D1D1)), onPressed:(){
                      myController.clear();


                    },) : Container(width: width * 0.0000001,), //Align(child: Icon(Icons.cancel), widthFactor: 5,),
                      hintText:"닉네임을 입력해 주세요" ,
                    hintStyle: TextStyle(fontFamily: 'MainFont', fontSize: 16, fontWeight: FontWeight.w600, color : Color(0xffACACAC)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffFC7521))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xffACACAC))
                    ),


                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top : 8 * height / height_whole),
            child: Container(
              height: 21 * height / height_whole,
              width : width * 0.75,
              child: errormessage,

            ),
          )
        ],
      ),
      bottomSheet: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: width,
            height: height * 0.07,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: nickname_correct? Color.fromRGBO(252, 99, 6, 1.0) : const Color(0xffD1D1D1)
              ),
              onPressed: () {
                if(nickname_correct){
                  image_plus ? _sendProfile() : _sendProfile_noimage();
                  Timer(Duration(seconds: 1), () { //2초후 화면 전환
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestScreen(widget.token)),
                    );
                  });
                }
              },
              child: Text("확인"),
            ),
          ),
        ),

      ),
    );
  }

  Future<void> _imagepicker() async {
    print("imagepicker --- start");
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    image = await _picker.pickImage(source: ImageSource.gallery,
      maxHeight: 300,
      maxWidth: 300,

    );
    final size = ImageSizeGetter.getSize(FileInput(File(image!.path)));
    imgsize_height = size.height;
    imgsize_width = size.width;
    //TODO image를 픽하면 빌드를 다시 한다.
    setState(() {

    });
  }
  Future<void> _sendProfile_noimage() async{
    var url = Uri.parse("https://api.cafeinofficial.com/members/2/ImageAndNickname");
    var accesstoken = widget.token;
    var response = http.patch(url , body: <String, dynamic>{'nickname': nick}, headers: {'cookie' : "accessToken=$accesstoken"});
    print(response.toString());
  }
  Future<void> _sendProfile() async {


    var formData = FormData.fromMap({"imageFile" :await MultipartFile.fromFile(image!.path) });
    print("정보 송신 전 데이터 =========" + formData.length.toString());
    var dio = new Dio();
    dio.options.contentType = 'multipart/form_data';
    dio.options.maxRedirects.isFinite;
    var accesstoken = widget.token;
    dio.options.headers = {'cookie' : "accessToken=$accesstoken"};
    dio.options.queryParameters = {'nickname' : nick ,"deleteImageId" : img_id };
    print("정보 송신 ======="  + dio.options.extra.toString());

    var res_dio = await dio.patch("https://api.cafeinofficial.com/members/2/ImageAndNickname", data : formData);
    print("결과 -------- "+res_dio.toString());
    //var response = await http.patch( url_phone,headers: {"cookie" : "eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTEwNTk1MDEsImV4cCI6MTY1MjI2OTEwMSwibWVtYmVySWQiOjF9.CXkIBe7DCy30wHvaDQ4hq61YZWx3vhL2Gw65e09QX9o"}, body: jsonEncode(req_body));
    //print(response.body);

    //var re = new http.MultipartRequest("PATCH", url);
    //re.headers['cookie'] = "eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTEwNTk1MDEsImV4cCI6MTY1MjI2OTEwMSwibWVtYmVySWQiOjF9.CXkIBe7DCy30wHvaDQ4hq61YZWx3vhL2Gw65e09QX9o";
    //re.fields["nickname"] = nick;


  }

  Future<void> _roadProfile() async {
    print("token으로 프로필 로드 시작 , token :" + widget.token);
    var url = Uri.parse("https://api.cafeinofficial.com/members/info");
    var accesstoken = widget.token;
    var response = await http.get(url , headers: {"cookie" : "accessToken=$accesstoken"});

    Map<String , dynamic> message = jsonDecode(response.body);

    img_id =message['data']['imageDto']['imageId'];
    print("바뀌는 이미지의 아이디는 ======" + img_id.toString());

    print("프로필 로드 완료 ---------- " + response.body.toString());
  }
  Widget _examString(String text){
    if(text.length > 10){
      return Text("10자이하로 입력해주세요", style: TextStyle(color : Colors.red, fontSize: 13, fontWeight: FontWeight.w500),);
    }else if(!nickname_correct){
      return Text("한글 , 영문, 숫자만 입력 가능합니다", style: TextStyle(color : Colors.red,  fontSize: 13, fontWeight: FontWeight.w500),);
    }else if(text.contains('ㅜ')||text.contains('ㅂ')||text.contains('ㅈ')||text.contains('ㄷ')||text.contains('ㄱ')||text.contains('ㅅ')||text.contains('ㅛ')||text.contains('ㅑ')||text.contains('ㅐ')||text.contains('ㅔ')||text.contains('ㅁ')||text.contains('ㄴ')||text.contains('ㅇ')||text.contains('ㄹ')||text.contains('ㅎ')||text.contains('ㅗ')||text.contains('ㅓ')||text.contains('ㅏ')||text.contains('ㅣ')||text.contains('ㅋ')||text.contains('ㅌ')||text.contains('ㅊ')||text.contains('ㅍ')||text.contains('ㅠ')){
      return Text("자음 , 모음만 단독으로 사용할 수 없어요", style: TextStyle(color : Colors.red,  fontSize: 13, fontWeight: FontWeight.w500),);
    }

    return Container();
  }

}
