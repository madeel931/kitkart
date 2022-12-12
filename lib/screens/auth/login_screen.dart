import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kit_kart/consts/consts.dart';
import 'package:kit_kart/screens/auth/sing_up_screen.dart';
import 'package:kit_kart/screens/home.dart';

import 'package:kit_kart/widgets_common/button_custom.dart';
import 'package:kit_kart/widgets_common/custom_text_field.dart';
import 'package:kit_kart/widgets_common/icon_login_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .32,
              ),
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
          20.heightBox,
          Row(
            children: [
              30.widthBox,
              const Text(
                'Welcome to ',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                    letterSpacing: -1,
                    fontWeight: FontWeight.w400),
              ),
              const Text(
                appname,
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 24,
                    letterSpacing: -2,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          10.heightBox,
                          CustomTextField(
                              label: const Text(emaillabel),
                              preIcon: const Icon(Icons.email)),
                          20.heightBox,
                          CustomTextField(
                              label: const Text(passwordlabel),
                              preIcon: const Icon(Icons.lock)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  forgotpassword,
                                  style: TextStyle(color: primaryColor),
                                )),
                          ),
                          5.heightBox,
                          CustomButton(
                              width: MediaQuery.of(context).size.width,
                              hight: 50.0,
                              color: primaryColor,
                              title: login,
                              fontsize: 20.0,
                              textcolor: whiteColor,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                );
                              }),
                          5.heightBox,
                          Row(
                            children: [
                              const Text(
                                "Don't have an account",
                                style: TextStyle(color: fontGrey),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SingUpScreen()),
                                    );
                                  },
                                  child: const Text(
                                    singUp,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: fontGrey),
                                  )),
                            ],
                          ),
                          5.heightBox,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          20.heightBox,
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Login With...',
              style: TextStyle(fontSize: 16, color: whiteColor),
            ),
          ),
          20.heightBox,
          IconLogin(
              onPressed: () {},
              hight: 60.0,
              width: MediaQuery.of(context).size.width,
              logo: googleLogo)
        ],
      ),
    );
  }
}
