import 'package:flutter/material.dart';

import '../consts/colors.dart';

Widget CustomButton(
    {color, textcolor, width, hight, title, onPressed, fontsize}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
        alignment: Alignment.center,
        height: hight,
        width: width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ], color: color, borderRadius: BorderRadius.circular(20)),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontsize,
              color: textcolor),
        )),
  );
}
