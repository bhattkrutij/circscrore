import 'package:circ_scrorer/utils/app_strings.dart';
import 'package:circ_scrorer/utils/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';
import 'diamentions.dart';

loaderWidget() {
  return const Center(
    child: CircularProgressIndicator(
      color: primaryColor,
    ),
  );
}

toast(String? value, {ToastGravity? gravity, length = Toast.LENGTH_SHORT, Color? bgColor, Color? textColor}) {
  Fluttertoast.showToast(
    msg: value!,
    toastLength: length,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: bgColor,
    textColor: textColor,
    fontSize: 16.0,
  );
}

borderSidePrimary() {
  return const BorderSide(width: 1, color: primaryColor);
}

primaryButtonStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(buttonBgColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: borderSidePrimary())));
}

inputDecorationPrimary({required String hintText, Icon? icon}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: AppTextStyles.normalSecondaryText14,
    border: const OutlineInputBorder(),
    suffix: icon ?? const SizedBox(),
  );
}

sizedBox({double? height, double? width}) {
  return SizedBox(
    height: height ?? 0,
    width: width ?? 0,
  );
}

commonScaffold({required BuildContext context, required String message, required Color bgColor}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 600),
      backgroundColor: Colors.red,
    ),
  );
}