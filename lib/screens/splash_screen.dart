import 'dart:async';

import 'package:flutter/material.dart';

import 'package:kit_kart/consts/consts.dart';
import 'package:kit_kart/screens/auth/login_screen.dart';
import 'package:kit_kart/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ], color: whiteColor, borderRadius: BorderRadius.circular(20)),
                child: Image.asset('assets/images/logo.png')),
            8.heightBox,
            const Text(
              appname,
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 26,
                  letterSpacing: -2,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Text(
              appversion,
            ),
            40.heightBox
          ],
        ),
      ),
    );
  }
}
