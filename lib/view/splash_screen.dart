import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:git_intro/constants/r.dart';
import 'package:git_intro/view/login_page.dart';
import 'package:git_intro/view/main/latihan_soal/home_page.dart';
import 'package:git_intro/view/main_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String route = "splash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // TODO redirect to register or home
        Navigator.of(context).pushReplacementNamed(MainPage.route);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.route);
      }

      // final Auth _auth = auth();

      // Future<UserCredential> signIn(String email, String password) async {
      //   final UserCredential user = await _auth
      //       .signInAndRetrieveDataWithEmailAndPassword(email, password);
      //   return user;
      // }
    });
    return Scaffold(
      //  appBar: AppBar(),//parameter appBar menerima sebuah widget appBar juga
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LoginPage();
          }));
        },
        child: Center(
          child: Image.asset(
            R.assets.icSplash,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      ), //membuat sebuah image menggunakan body
      backgroundColor: R.colors.primary,
    );
  }
}
