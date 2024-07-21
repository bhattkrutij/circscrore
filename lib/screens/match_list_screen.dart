import 'package:circ_scrorer/utils/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/diamentions.dart';
import '../utils/widgets.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(matches, style: AppTextStyles.normalBlack18),
            sizedBox(height: 16),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildTab(text: live, index: 0),
                  buildTab(text: recent, index: 1),
                  buildTab(text: upcoming, index: 2)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTab({required text, required int index}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            color: selectedIndex == index ? primaryColor.withOpacity(0.8) : whiteColor,
          ),
          height: Dimensions.height40,
          child: Center(
            child: Text(
              text,
              style: selectedIndex == index ? AppTextStyles.normalWhite14 : AppTextStyles.normalPrimary14,
            ),
          ),
        ),
      ),
    );
  }
}