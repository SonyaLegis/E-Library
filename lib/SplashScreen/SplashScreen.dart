// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:e_library/SplashScreen/LewatScreen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example5 = SplashScreenView(
      navigateRoute: LewatScreen(),
      duration: 3000,
      imageSize: 200,
      imageSrc: "assets/SplashScreen.png",
      backgroundColor: Color.fromRGBO(39, 164, 184, 1),
    );
    return MaterialApp(
      home: example5,
    );
  }
}
