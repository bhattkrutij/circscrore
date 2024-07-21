import 'package:circ_scrorer/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'diamentions.dart';

class ElevatedAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ElevatedAppButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.width,
      height: Dimensions.appButtonHeight,
      child: ElevatedButton(
        onPressed: onTap,
        style: primaryButtonStyle(),
        child: Text(
          title,
          style: const TextStyle(color: buttonTextColor),
        ),
      ),
    );
  }
}