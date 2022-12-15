import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kit_kart/consts/colors.dart';
import 'package:kit_kart/consts/consts.dart';
import 'package:kit_kart/consts/images.dart';

Widget featuredCard({String? title, image}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 4), // changes position of shadow
        ),
      ], color: whiteColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 60,
            fit: BoxFit.fill,
          ),
          10.widthBox,
          Text(title!)
        ],
      ),
    ),
  );
}
