import 'dart:ui';

import 'package:circ_scrorer/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle boldBlack30 = const TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: blackColor,
  );
  static TextStyle boldPrimary30 = const TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );
  static TextStyle boldPrimary20 = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );
  static TextStyle normalBlack18 = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: textColorPrimary,
  );
  static TextStyle normalBlack16 = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: blackColor,
  );
  static TextStyle normalWhite14 = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: whiteColor,
  );
  static TextStyle normalPrimary14 = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: primaryColor,
  );
  static TextStyle normalSecondaryText14 = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: textColorSecondary,
  );
}