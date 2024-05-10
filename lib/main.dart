import 'package:bingung_di_bandung/Home/home.dart';
import 'package:bingung_di_bandung/features/Login/presentation/pages/login.dart';
import 'package:bingung_di_bandung/splash_screen.dart';
import 'package:flutter/material.dart';





void main() {
  runApp(const init());
}

class init extends StatelessWidget {
  const init({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}