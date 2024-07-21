import 'package:circ_scrorer/models/tournament_model.dart';
import 'package:circ_scrorer/utils/app_colors.dart';
import 'package:circ_scrorer/utils/app_strings.dart';
import 'package:circ_scrorer/utils/diamentions.dart';
import 'package:circ_scrorer/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/textstyles.dart';
import '../widgets/tournament_item.dart';

class TournamentListScreen extends StatefulWidget {
  const TournamentListScreen({super.key});

  @override
  State<TournamentListScreen> createState() => _TournamentListScreenState();
}

class _TournamentListScreenState extends State<TournamentListScreen> {
  final List<TournamentModel> tournamentsList = [
    TournamentModel(
      tournamentName: 'Premier League',
      overs: '20 Overs',
      startDate: '12th Aug',
      endDate: '18th Aug',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    TournamentModel(
      tournamentName: 'Champions Trophy',
      overs: '50 Overs',
      startDate: '22nd Sep',
      endDate: '30th Sep',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    TournamentModel(
      tournamentName: 'World Cup',
      overs: '50 Overs',
      startDate: '1st Jun',
      endDate: '15th Jun',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    TournamentModel(
      tournamentName: 'Premier League',
      overs: '20 Overs',
      startDate: '12th Aug',
      endDate: '18th Aug',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    TournamentModel(
      tournamentName: 'Champions Trophy',
      overs: '50 Overs',
      startDate: '22nd Sep',
      endDate: '30th Sep',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    TournamentModel(
      tournamentName: 'World Cup',
      overs: '50 Overs',
      startDate: '1st Jun',
      endDate: '15th Jun',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    TournamentModel(
      tournamentName: 'Premier League',
      overs: '20 Overs',
      startDate: '12th Aug',
      endDate: '18th Aug',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    TournamentModel(
      tournamentName: 'Champions Trophy',
      overs: '50 Overs',
      startDate: '22nd Sep',
      endDate: '30th Sep',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    TournamentModel(
      tournamentName: 'World Cup',
      overs: '50 Overs',
      startDate: '1st Jun',
      endDate: '15th Jun',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];
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
            sizedBox(height: 8),
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