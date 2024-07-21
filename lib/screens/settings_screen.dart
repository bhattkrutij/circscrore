import 'package:flutter/cupertino.dart';

import '../utils/textstyles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Settings",
        style: AppTextStyles.boldBlack30,
      ),
    );
    ;
  }
}