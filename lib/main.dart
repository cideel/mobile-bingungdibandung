import 'package:bingung_di_bandung/Bottom%20Navigation%20Bar/bottomNav.dart';
import 'package:bingung_di_bandung/Home/home.dart';
import 'package:bingung_di_bandung/features/Login/presentation/pages/login.dart';
import 'package:bingung_di_bandung/firebase_options.dart';
import 'package:bingung_di_bandung/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Firebase.apps.isEmpty){
    await Firebase.initializeApp(
      name: "bingungbandung",
      options: FirebaseOptions(
    apiKey: 'AIzaSyBInaigb27QvDY2w-NaiSRHmIi2LZS6NM4',
    appId: '1:150788122768:android:221921825e913343819015',
    messagingSenderId: '150788122768',
    projectId: 'bingung-di-bandung-db',
    storageBucket: 'bingung-di-bandung-db.appspot.com',
    databaseURL: 'https://bingung-di-bandung-db-default-rtdb.asia-southeast1.firebasedatabase.app/',
    
  ));
  }
  
  runApp(const initApp());
}

class initApp extends StatelessWidget {
  const initApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: MyPage.splashScren, getPages: MyPage.pages);
  }
}
