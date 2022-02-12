import 'package:cafein_front/Login/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'Login/RegisterScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
        RegisterScreen()
    );
  }
}
