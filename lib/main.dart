import 'package:cafein_front/Login/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'Login/RegisterScreen.dart';
var normaltheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0.0
  ),
  scaffoldBackgroundColor: Colors.white
);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:
        LoginScreen(),
      theme: normaltheme
    );
  }
}
