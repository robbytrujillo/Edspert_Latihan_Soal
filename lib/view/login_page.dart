import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Login"),
            Image.asset("assets/img_login.png"),
            Text("Selamat Datang"),
            Text(
                "Selamat Datang Di Aplikasi Widya Edu Aplikasi Latihan Dan Konsultasi Soal"),
            ElevatedButton(onPressed: onPressed, child: child)
          ],
        ),
      ),
    );
  }
}
