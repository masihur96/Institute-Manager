import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:im_app_student/model/custom_size.dart';
import 'package:im_app_student/view/dashboard_screen.dart';
import 'package:im_app_student/view/login_screen.dart';
import 'package:im_app_student/view/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String dotCoderLogo =
      'https://raw.githubusercontent.com/OsamaQureshi796/MealMonkey/main/assets/dotcoder.png';

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Timer(Duration(seconds: 5), () => SignUpScreen());
    } else {
      Timer(Duration(seconds: 5), () => DeshBoardScreen());
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: screenSize(context, 1),
                height: 220,
                child: Image.network(
                  dotCoderLogo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("FCM by DOTCODER")
          ],
        ),
      ),
    );
  }
}
