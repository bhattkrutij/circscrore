import 'package:circ_scrorer/models/tournament_model.dart';
import 'package:circ_scrorer/utils/app_colors.dart';
import 'package:circ_scrorer/utils/diamentions.dart';
import 'package:circ_scrorer/utils/textstyles.dart';
import 'package:circ_scrorer/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_images.dart';

class TournamentItem extends StatelessWidget {
  final TournamentModel tournament;

  const TournamentItem({required this.tournament});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.margin4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.borderRadius),
          border: Border.all(color: borderColor, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.padding10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.circularRadius40)),
              child: Image.asset(logo, width: Dimensions.width50, height: Dimensions.height50, fit: BoxFit.cover),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            sizedBox(width: Dimensions.width10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tournament.tournamentName, style: AppTextStyles.normalBlack16),
                  sizedBox(height: Dimensions.height6),
                  Text(
                    tournament.overs,
                    style: AppTextStyles.normalSecondaryText14,
                  ),
                  sizedBox(height: Dimensions.height6),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: Dimensions.iconSize,
                        color: primaryColor,
                      ),
                      sizedBox(width: Dimensions.height6),
                      Text(
                        '${tournament.startDate} - ${tournament.endDate}',
                        style: AppTextStyles.normalSecondaryText14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}