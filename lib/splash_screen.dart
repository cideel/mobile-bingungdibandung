import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:bingung_di_bandung/features/Login/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
