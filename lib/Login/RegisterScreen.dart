

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cafein_front/Login/LoginScreen.dart';
import 'package:cafein_front/Login/PhoneScreen.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

String profileimg = " ";
bool first_load = true;
bool image_plus = false;
XFile? image;
final myController = TextEditingController();
String nickname = myController.text; //입력받은 닉네임
bool nickname_correct = false;
String nick =" ";

class RegisterScreen extends StatefulWidget {
  //TODO 전 화면에서 token 받기
  final String token;
  //RegisterScreen({Key? key, required this.token }) : super(key: key);
  const RegisterScreen(this.token);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}




class _RegisterScreenState extends State<RegisterScreen> {



  @override
  Widget build(BuildContext context) {
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
        title: Text("닉네임 설정"),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            /*
            취소버튼 클릭
             */
          }, icon: Icon(Icons.cancel_outlined), color: Colors.black,iconSize: 30,),

        ],

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
                      fit : BoxFit.fitWidth,
                      image: FileImage(File(image!.path)),
                  )
              ),
            ):Image.asset(profileimg, fit: BoxFit.fill,)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                height: height * 0.07,
                width: width * 0.8,
                child: TextFormField(

                  onChanged: (text){
                    setState(() {
                      if(text.length >= 10||text.length ==0 || text.contains('!')|| text.contains('@')|| text.contains('#')|| text.contains('~')|| text.contains('`')|| text.contains('%')|| text.contains('^')|| text.contains('&')|| text.contains('*')|| text.contains('(')|| text.contains(')')|| text.contains('-')|| text.contains('_')|| text.contains('=')|| text.contains('+')|| text.contains('[')|| text.contains(']')|| text.contains('{')|| text.contains('}')|| text.contains('|')|| text.contains(';')|| text.contains(':')|| text.contains('/')|| text.contains('?')|| text.contains('>')|| text.contains('.')|| text.contains('<')|| text.contains(',')|| text.contains('"')|| text.contains("'")){
                        nickname_correct = false;
                      }
                      else{
                        nickname_correct = true;
                        nick = text;
                      }
                    });
                  },

                  cursorColor: Color.fromRGBO(252, 99, 6, 1.0),

                  controller: myController,
                  decoration: InputDecoration(

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(width: 1, color: Color.fromRGBO(252, 99, 6, 1.0))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(width: 1, color: Color.fromRGBO(252, 99, 6, 1.0))
                    ),
                    labelText: nickname_correct ? "멋진 닉네임이에요!" : "10자 이하, 영문/숫자/한글만 사용 가능해요",
                    labelStyle: TextStyle(color : nickname_correct ? Colors.blue : Color.fromRGBO(252, 99, 6, 1.0))
                  ),
                ),
              ),
            ],
          ),
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
                  _sendProfile();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhoneScreen()),
                  );
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
    image = await _picker.pickImage(source: ImageSource.gallery);
    //TODO image를 픽하면 빌드를 다시 한다.
    setState(() {

    });
  }

  Future<void> _sendProfile() async {
    var req_body = new Map<String, dynamic>();
    var url = Uri.parse("https://api.cafeinofficial.com/members/2/ImageAndNickname");
    req_body['nickname'] = nick;
    req_body["imageFile"] = await MultipartFile.fromFile(image!.path);
    
    req_body["deleteImageId"] = 30;
    var formData = FormData.fromMap(req_body);
    var dio = new Dio();
    dio.options.contentType = 'multipart/form_data';
    dio.options.maxRedirects.isFinite;
    dio.options.headers = {'cookie' : widget.token};
    var res_dio = await dio.patch("https://api.cafeinofficial.com/members/2/ImageAndNickname", data : formData);
    print(res_dio.data);
    //var response = await http.patch( url_phone,headers: {"cookie" : "eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTEwNTk1MDEsImV4cCI6MTY1MjI2OTEwMSwibWVtYmVySWQiOjF9.CXkIBe7DCy30wHvaDQ4hq61YZWx3vhL2Gw65e09QX9o"}, body: jsonEncode(req_body));
    //print(response.body);

    //var re = new http.MultipartRequest("PATCH", url);
    //re.headers['cookie'] = "eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTEwNTk1MDEsImV4cCI6MTY1MjI2OTEwMSwibWVtYmVySWQiOjF9.CXkIBe7DCy30wHvaDQ4hq61YZWx3vhL2Gw65e09QX9o";
    //re.fields["nickname"] = nick;


  }
}
