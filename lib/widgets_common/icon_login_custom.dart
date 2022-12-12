import 'package:flutter/material.dart';

import '../consts/consts.dart';

Widget IconLogin({logo, width, hight, onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      width: width,
      height: hight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(100),
        color: whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(logo)),
          const Text(
            'Login with Google acoount',
            style: TextStyle(fontSize: 18, fontFamily: bold, color: fontGrey),
          )
        ],
      ),
    ),
  );
}
