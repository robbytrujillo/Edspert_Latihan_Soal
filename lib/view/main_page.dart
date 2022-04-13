import 'package:flutter/material.dart';
import 'package:git_intro/constants/r.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static String route = "main_page";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 20,
              color: Colors.black.withOpacity(0.06))
        ]),
        child: BottomAppBar(
            color: Colors.white,
            child: Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Material(
                        child: InkWell(
                          child: Column(
                            children: [
                              Image.asset(
                                R.assets.icHome,
                                height: 20,
                              ),
                              Text("Home")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Material(
                        child: InkWell(
                          child: Column(
                            children: [
                              Opacity(
                                opacity: 0,
                                child: Image.asset(
                                  R.assets.icHome,
                                  height: 20,
                                ),
                              ),
                              Text("Diskusi")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Material(
                        child: InkWell(
                          child: Column(
                            children: [Icon(Icons.person), Text("Profile")],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
