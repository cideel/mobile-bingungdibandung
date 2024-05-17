import 'package:bingung_di_bandung/Bottom%20Navigation%20Bar/bottomNav.dart';
import 'package:bingung_di_bandung/Home/home.dart';
import 'package:bingung_di_bandung/features/Login/presentation/pages/login.dart';
import 'package:bingung_di_bandung/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:get/get.dart';





void main() {
  runApp(const initApp());
}

class initApp extends StatelessWidget {
  const initApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: MyPage.splashScren,  
      getPages : MyPage.pages
    );
  }
}

