import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
                child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Sign Up Now",
                  style: GoogleFonts.openSans(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Please fill details and create account",
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  // textfield username logic
                  decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person_2),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password must be 8 characters",
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.offNamed(MyPage.navbar);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      minimumSize: MaterialStateProperty.all(Size(380, 56)),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff0D6EFD))),
                ),
                SizedBox(height: 40,),

                RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: "Already have an account ",
                          style: TextStyle(
                              color: Color(0xff707B81), fontSize: 14)),
                      TextSpan(
                          text: "Sign In",
                          recognizer: TapGestureRecognizer()
                          ..onTap = (){
                            Get.offNamed(MyPage.login);
                          },
                          style: TextStyle(
                              fontSize: 14, color: Color(0xff0D6EFD)),
                           ),
                              
                              
                    ])),
                SizedBox(height: 20,),
                Text("Or connect",style: TextStyle(fontSize: 14,color: Color(0xff707B81)),),
                SizedBox(height: 36,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset('assets/facebook.png',height: 44,width: 44,),
                  SizedBox(width: 20,),
                  Image.asset('assets/instagram.png',height: 44,width: 44,),
                  SizedBox(width: 20,),
                  Image.asset('assets/twitter.png',height: 44,width: 44,)



                ],)
                
              ],
            )),
          )
        ],
      ),
    );
  }
}
