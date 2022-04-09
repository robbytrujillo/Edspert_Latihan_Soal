import 'package:flutter/material.dart';
import 'package:git_intro/view/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            "assets/auth/ic_splash.png",
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      ), //membuat sebuah image menggunakan body
      backgroundColor: Color(0xff3A7FD5),
    );
  }
}
