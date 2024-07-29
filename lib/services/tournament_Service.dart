import 'package:circ_scrorer/models/tournament_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/keys.dart';
import '../utils/widgets.dart';

class TournamentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTournament(TournamentModel tournamentModel) async {
    Map<String, dynamic> tournamentData = {
      'name': tournamentModel.tournamentName,
      'type': tournamentModel.type,
      'overs': tournamentModel.overs,
      'start_date': tournamentModel.startDate,
      'end_date': tournamentModel.endDate,
    };
    try {
      await _firestore.collection(tournamentCollection).add(tournamentData);
      toast("Tournament added successfully");
    } catch (e) {
      toast(e.toString());
      throw Exception('Error adding user to Firestore: $e');
    }
  }
}