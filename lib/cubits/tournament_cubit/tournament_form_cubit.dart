import 'package:bloc/bloc.dart';
import 'package:circ_scrorer/models/tournament_model.dart';
import 'package:circ_scrorer/services/tournament_Service.dart';
import 'package:circ_scrorer/utils/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'tournament_form_state.dart';

class TournamentFormCubit extends Cubit<TournamentFormState> {
  final TournamentService tournamentService = TournamentService();
  TournamentFormCubit() : super(TournamentFormInitial());
  void initForm({
    String name = '',
    String type = typeT20,
    String overs = '20',
    String startDate = '',
    String endDate = '',
  }) {
    emit(state.copyWith(name: name, type: type, startDate: startDate, endDate: endDate, overs: overs));
  }

  void updateName(String? tournamentName) {
    emit(state.copyWith(name: tournamentName));
  }

  void updateOvers(String? tournamentOvers) {
    emit(state.copyWith(overs: tournamentOvers));
  }

  void updateType(String? tournamentType) {
    print("===============update type${tournamentType}");
    emit(state.copyWith(type: tournamentType));
  }

  void updateStartDate(String? tournamentStartDate) {
    emit(state.copyWith(startDate: tournamentStartDate));
  }

  void updateEndDate(String? tournamentEndDate) {
    emit(state.copyWith(endDate: tournamentEndDate));
  }

  void updateAutoValidateMode(AutovalidateMode? autovalidateMode) {
    emit(state.copyWith(autovalidateMode: autovalidateMode));
  }

  void addTournament() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 4));
    TournamentModel tournamentModel = TournamentModel(
        tournamentName: state.name,
        overs: state.overs,
        startDate: state.startDate,
        type: state.type,
        endDate: state.endDate,
        imageUrl: '');
    tournamentService.addTournament(tournamentModel);
    emit(state.copyWith(isLoading: false));
  }
}