import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kit_kart/consts/consts.dart';
import 'package:kit_kart/controller/authController.dart';
import 'package:kit_kart/screens/auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              Get.put(AuthController().signOutFunction());
              Get.offAll(LoginScreen());
            },
            child: Text(
              'logout',
            )),
      ),
    );
  }
}
