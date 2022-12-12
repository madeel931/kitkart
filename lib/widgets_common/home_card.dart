import 'package:flutter/material.dart';
import 'package:kit_kart/consts/colors.dart';
import 'package:kit_kart/consts/consts.dart';

Widget homeCard({hight, width, title, icon}) {
  return Container(
    height: hight,
    width: width,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(0, 4), // changes position of shadow
      ),
    ], color: whiteColor, borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 26,),
        10.heightBox,
        Text(title)
      ],
    ),
  );
}
