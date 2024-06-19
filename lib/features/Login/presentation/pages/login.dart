import 'package:bingung_di_bandung/Sign%20Up/signUp.dart';
import 'package:bingung_di_bandung/controller/autController.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';

class Login extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 61,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: _leftArrow(),
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: Column(
              children: [
                _signInText(),
                SizedBox(
                  height: 17,
                ),
                _pleaseText(),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(13, 110, 253, 1)),
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                Obx(() {
                  return authController.isLoading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (emailController.text.trim().isEmpty ||
                                passwordController.text.trim().isEmpty) {
                              Get.snackbar(
                                'Error',
                                'Email and password are required.',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                              return;
                            }
                            authController.login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(Size(360, 56)),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff0D6EFD)),
                          ),
                        );
                }),
                SizedBox(
                  height: 40,
                ),
                RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: "Don't have an account  ",
                          style: TextStyle(
                              color: Color(0xff707B81), fontSize: 14)),
                      TextSpan(
                          text: "Sign Up",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff0D6EFD)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Clicked");
                              Get.toNamed(MyPage.signUp);
                            }),
                    ])),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Or connect",
                  style: TextStyle(fontSize: 14, color: Color(0xff707B81)),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/facebook.png",
                        height: 44,
                        width: 44,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/instagram.png",
                        height: 44,
                        width: 44,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/twitter.png",
                        height: 44,
                        width: 44,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _buttonSignIn extends StatelessWidget {
  const _buttonSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(
          MyPage.navbar,
        );
      },
      child: Text(
        "Sign In",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          minimumSize: MaterialStateProperty.all(Size(360, 56)),
          backgroundColor: MaterialStatePropertyAll(Color(0xff0D6EFD))),
    );
  }
}

class _emailText extends StatelessWidget {
  const _emailText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Email",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ));
  }
}

class _pleaseText extends StatelessWidget {
  const _pleaseText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Please sign in to continue to our app",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
    );
  }
}

class _signInText extends StatelessWidget {
  const _signInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Sign in Now",
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    );
  }
}

class _leftArrow extends StatelessWidget {
  const _leftArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.keyboard_arrow_left_outlined, size: 44),
    ]);
  }
}
