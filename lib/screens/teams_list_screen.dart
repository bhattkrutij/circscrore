import 'package:flutter/cupertino.dart';

import '../utils/textstyles.dart';

class TeamsListScreen extends StatefulWidget {
  const TeamsListScreen({super.key});

  @override
  State<TeamsListScreen> createState() => _TeamsListScreenState();
}

class _TeamsListScreenState extends State<TeamsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "teams",
        style: AppTextStyles.boldBlack30,
      ),
    );
    ;
  }
}