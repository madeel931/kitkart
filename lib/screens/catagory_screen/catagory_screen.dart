import 'package:flutter/material.dart';

import 'package:kit_kart/consts/list.dart';
import 'package:get/get.dart';
import 'package:kit_kart/consts/consts.dart';
import 'package:kit_kart/screens/catagory_screen/category_details.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          title: const Text(
            'Categories',
            style: TextStyle(fontFamily: bold),
          )),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 200,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8),
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                      () => CategoryDetails(title: categorytitleList[index]));
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        categoryImageList[index],
                        width: 200,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      20.heightBox,
                      Text(
                        categorytitleList[index],
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}
