import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kit_kart/consts/colors.dart';
import 'package:kit_kart/consts/consts.dart';
import 'package:kit_kart/consts/styles.dart';
import 'package:kit_kart/screens/catagory_screen/item_details.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: const TextStyle(color: whiteColor),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      6,
                      (index) => Container(
                            height: 60,
                            width: 150,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Text(
                              'Sub Category',
                              style: TextStyle(fontSize: 16),
                            ),
                          ))),
            ),
            20.heightBox,
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 300),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ItemDetails(title: 'Macbook Air'));
                    },
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP7,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const Spacer(),
                          const Text('Macbook Air (2012) 128/SSD'),
                          10.heightBox,
                          const Text(
                            '\$500',
                            style: TextStyle(
                                color: primaryColor,
                                fontFamily: bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
