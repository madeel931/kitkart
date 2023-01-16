import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kit_kart/consts/consts.dart';
import 'package:kit_kart/controller/authController.dart';
import 'package:kit_kart/screens/auth/sing_up_screen.dart';

import 'package:kit_kart/screens/home.dart';

import 'package:kit_kart/widgets_common/button_custom.dart';
import 'package:kit_kart/widgets_common/custom_text_field.dart';
import 'package:kit_kart/widgets_common/icon_login_custom.dart';
import 'package:kit_kart/widgets_common/toast.dart';

import '../../controller/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// login status
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
     
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Home(
            user: user,
          ),
        ),
      );
    }
    return firebaseApp;
  }

  //
  final _formKey = GlobalKey<FormState>();
  var controller = Get.put(AuthController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
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
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20)),
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
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  10.heightBox,
                                  CustomTextField(
                                    validation: (value) =>
                                        Validator.validateEmail(email: value),
                                    controller: emailController,
                                    label: const Text(emaillabel),
                                    preIcon: const Icon(Icons.email),
                                  ),
                                  20.heightBox,
                                  CustomTextField(
                                      controller: passwordController,
                                      label: const Text(passwordlabel),
                                      preIcon: const Icon(Icons.lock),
                                      validation: (value) =>
                                          Validator.validatePassword(
                                              password: value)),
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
                                  // singIn button
                                  CustomButton(
                                      width: MediaQuery.of(context).size.width,
                                      hight: 50.0,
                                      color: primaryColor,
                                      title: login,
                                      fontsize: 20.0,
                                      textcolor: whiteColor,
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          User? user = await AuthController
                                              .signInUsingEmailPassword(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  context: context);
                                          if (user != null) {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Home(user: user)),
                                            );
                                          }
                                        }
                                        
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
                    onPressed: () async {
                      User? user = await controller.googleSignIn(context);
                      await controller.googleUserData();
                      if (user != null) {
                        Get.offAll(() => Home(user: user));
                      }
                    },
                    hight: 60.0,
                    width: MediaQuery.of(context).size.width,
                    logo: googleLogo)
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
