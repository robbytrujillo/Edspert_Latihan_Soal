import 'dart:async';

import 'package:flutter/material.dart';
import 'package:git_intro/constants/r.dart';
import 'package:git_intro/view/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String route = "splash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      //Navigator.of(context)
      //    .push(MaterialPageRoute(builder: (context) => LoginPage()));
      Navigator.of(context).pushReplacementNamed(LoginPage.route);
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
