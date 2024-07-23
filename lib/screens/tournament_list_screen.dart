import 'package:circ_scrorer/utils/app_strings.dart';
import 'package:circ_scrorer/utils/diamentions.dart';
import 'package:circ_scrorer/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../static_data.dart';
import '../utils/textstyles.dart';
import '../widgets/tournament_item.dart';

class TournamentListScreen extends StatefulWidget {
  const TournamentListScreen({super.key});

  @override
  State<TournamentListScreen> createState() => _TournamentListScreenState();
}

class _TournamentListScreenState extends State<TournamentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.padding10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tournaments, style: AppTextStyles.normalBlack18),
            sizedBox(height: Dimensions.height10),
            Expanded(
              child: ListView.builder(
                itemCount: tournamentsList.length,
                itemBuilder: (context, index) {
                  return TournamentItem(tournament: tournamentsList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}