import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:kit_kart/consts/consts.dart';
import 'package:kit_kart/controller/authController.dart';
import 'package:kit_kart/screens/home.dart';

import '../../widgets_common/button_custom.dart';
import '../../widgets_common/custom_text_field.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePasswordController = TextEditingController();
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
                'Join to ',
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
                              controller: nameController,
                              label: const Text(namelabel),
                              preIcon: const Icon(Icons.person)),
                          20.heightBox,
                          CustomTextField(
                              controller: emailController,
                              label: const Text(emaillabel),
                              preIcon: const Icon(Icons.email)),
                          20.heightBox,
                          CustomTextField(
                              controller: passwordController,
                              label: const Text(passwordlabel),
                              preIcon: const Icon(Icons.lock)),
                          20.heightBox,
                          CustomTextField(
                              controller: reTypePasswordController,
                              label: const Text(retypepasswordlabel),
                              preIcon: const Icon(Icons.lock)),
                          10.heightBox,
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: primaryColor,
                                  checkColor: whiteColor,
                                  value: isCheck,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isCheck = newValue;
                                    });
                                  }),
                              Expanded(
                                child: RichText(
                                    text: const TextSpan(children: [
                                  TextSpan(
                                      text: 'I agree to the ',
                                      style: TextStyle(
                                          fontSize: 16, color: fontGrey)),
                                  TextSpan(
                                      text: termsCond,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor)),
                                  TextSpan(
                                      text: ' & ',
                                      style: TextStyle(
                                          fontSize: 16, color: fontGrey)),
                                  TextSpan(
                                      text: privacypolicy,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor)),
                                ])),
                              )
                            ],
                          ),
                          10.heightBox,
                          CustomButton(
                              width: MediaQuery.of(context).size.width,
                              hight: 50.0,
                              color: primaryColor,
                              title: singUp,
                              fontsize: 20.0,
                              textcolor: whiteColor,
                              onPressed: () async {
                                try {
                                  await controller
                                      .signUpFunction(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) {
                                    return controller.storeUserData(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }).then((value) {
                                    Get.offAll(() => const Home());
                                  });
                                } catch (e) {
                                  auth.signOut();
                                  print(e);
                                }
                              }),
                          5.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an acount",
                                style: TextStyle(color: fontGrey),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    login,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: fontGrey),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
