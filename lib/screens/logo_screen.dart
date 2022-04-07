import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/account_screen.dart';


class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sleepTime();
  }

  bool logoVisibility = false;
  void sleepTime()async{
    await Future.delayed(Duration(milliseconds: 400));
    setState(() {
      logoVisibility = true;

    });
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement<void, void>(
      context,
      CupertinoPageRoute<void>(
        builder: (BuildContext context) => const AccountScreen(),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Visibility(
                visible: logoVisibility,
                child: Container(
                  height: 70,
                  width: 220,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/images/netflix_logo1.png'),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
