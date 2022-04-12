import 'package:flutter/material.dart';
import 'package:git_intro/constants/r.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static String route = "register_page";
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Yuk isi data diri!",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterTextField(
              hintText: 'Email Anda',
              title: "Email",
            ),
            RegisterTextField(
              hintText: 'Nama Lengkap Anda',
              title: "Nama Lengkap",
            ),
            SizedBox(height: 5),
            Text("Jenis Kelamin",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 5),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Laki-laki"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Perempuan"),
                ),
              ],
            ),
            RegisterTextField(
              hintText: 'Nama Sekolah',
              title: "Nama Sekolah",
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    Key? key,
    required this.title,
    required this.hintText,
  }) : super(key: key);
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: R.colors.greyBorder)),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: R.colors.greyHintText,
                )),
          ),
        ),
      ],
    );
  }
}
