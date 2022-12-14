import 'package:flutter/material.dart';

import '../consts/colors.dart';

Widget CustomTextField({Widget? label, Widget? preIcon, controller}) {
  return TextFormField(
    autofocus: false,
    controller: controller,
    cursorColor: primaryColor,
    decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor)),
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        prefixIcon: preIcon,
        label: label,
        fillColor: lightGrey,
        focusColor: primaryColor,
        filled: true),
  );
}
