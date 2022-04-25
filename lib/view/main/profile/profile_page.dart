import 'package:flutter/material.dart';
import 'package:git_intro/constants/r.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun Saya"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 28,
              bottom: 60,
              right: 15,
              left: 15,
            ),
            decoration: BoxDecoration(
                color: R.colors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                  bottomRight: Radius.circular(9),
                )),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama User",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Nama Sekolah User",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  R.assets.imgUser,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
