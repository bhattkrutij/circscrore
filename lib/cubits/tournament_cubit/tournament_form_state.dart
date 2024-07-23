part of 'tournament_form_cubit.dart';

@immutable
class TournamentFormState {
  final AutovalidateMode autovalidateMode;
  final String tournamentName;
  final String tournamentType;
  final String tournamentStartDate;
  final String tournamentEndDate;

  const TournamentFormState(
      {this.autovalidateMode = AutovalidateMode.disabled,
      this.tournamentName = "",
      this.tournamentType = "",
      this.tournamentEndDate = "",
      this.tournamentStartDate = ""});
  TournamentFormState copyWith({
    String? name,
    String? type,
    String? endDate,
    String? startDate,
    AutovalidateMode? autovalidateMode,
  }) {
    return TournamentFormState(
      tournamentName: name ?? this.tournamentName,
      tournamentType: type ?? this.tournamentType,
      tournamentEndDate: endDate ?? this.tournamentEndDate,
      tournamentStartDate: startDate ?? this.tournamentStartDate,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }
}

final class TournamentFormInitial extends TournamentFormState {}