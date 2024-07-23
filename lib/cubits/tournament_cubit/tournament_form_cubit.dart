import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'tournament_form_state.dart';

class TournamentFormCubit extends Cubit<TournamentFormState> {
  TournamentFormCubit() : super(TournamentFormInitial());
  void initForm({
    String name = '',
    String type = '',
    String startDate = '',
    String endDate = '',
  }) {
    emit(state.copyWith(
      name: name,
      type: type,
      startDate: startDate,
      endDate: endDate,
    ));
  }

  void updateName(String? tournamentName) {
    emit(state.copyWith(name: tournamentName));
  }

  void updateType(String? tournamentType) {
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

  // void reset() {
  //   emit(const FormValidatorUpdate());
  // }
}