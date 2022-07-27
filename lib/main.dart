// @dart=2.9
import 'package:e_library/Page/Beranda.dart';
import 'package:e_library/SplashScreen/SplashScreen.dart';
// import 'package:e_library/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Libary',
      home: Beranda(),
    );
  }
}
