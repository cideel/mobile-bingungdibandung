import 'dart:async';
import 'package:bingung_di_bandung/Home/home.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:bingung_di_bandung/features/Login/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    

    // Gunakan debounce untuk menunda navigasi selama 2 detik
    Future.delayed(Duration(seconds: 2), () {

      Get.offNamed(MyPage.login);
      
       // Navigasi ke halaman login
    });
  }
}

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

 


  
  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Image.asset("assets/splashs.png",width: 264,height: 211,),
            SizedBox(height: 50,),
            Text("Bingung",style: GoogleFonts.satisfy(fontSize: 50,color: Color.fromARGB(255, 21, 119, 238),letterSpacing: 2,height: 0.9999)),
            Text("di Bandung?",style:GoogleFonts.satisfy(fontSize: 50,color: Color.fromARGB(255, 21, 119, 238),letterSpacing: 2,height: 0.9999,),)

            

          ],
        ),
      ),


    );
  }
  }
