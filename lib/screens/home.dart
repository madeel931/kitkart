import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kit_kart/consts/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:kit_kart/controller/home_controller.dart';
import 'package:kit_kart/screens/cart_screen/cart_screen.dart';
import 'package:kit_kart/screens/catagory_screen/catagory_screen.dart';
import 'package:kit_kart/screens/favorite_screen/favorite_screen.dart';
import 'package:kit_kart/screens/home_screen/home_screen.dart';
import 'package:kit_kart/screens/profile_screen/profile_screen.dart';

class Home extends StatefulWidget {
  final User user;
  Home({
    super.key, required this.user
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(HomeController());
  var navBody = [
    HomeScreen(),
    const CatagoryScreen(),
    const CartScreen(),
    const FavoriteScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          index: controller.currentNavIndex.value,
          height: 75.0,
          items: const <Widget>[
            Icon(Icons.home, color: whiteColor, size: 30),
            Icon(Icons.category, color: whiteColor, size: 30),
            Icon(Icons.shopping_cart, color: whiteColor, size: 30),
            Icon(Icons.favorite, color: whiteColor, size: 30),
          ],
          color: primaryColor,
          buttonBackgroundColor: primaryColor,
          backgroundColor: whiteColor,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (value) {
            setState(() {
              controller.currentNavIndex.value = value;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
      backgroundColor: scofldColor,
      body: Column(
        children: [
          Obx((() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))))
        ],
      ),
    );
  }
}
