part of 'tournament_form_cubit.dart';

@immutable
class TournamentFormState {
  final AutovalidateMode autovalidateMode;
  final String name;
  final String type;
  final String startDate;
  final String endDate;
  final String overs;

  const TournamentFormState(
      {this.autovalidateMode = AutovalidateMode.disabled,
      this.name = "",
      this.type = "",
      this.endDate = "",
      this.startDate = "",
      this.overs = ""});
  TournamentFormState copyWith({
    String? name,
    String? type,
    String? endDate,
    String? startDate,
    String? overs,
    AutovalidateMode? autovalidateMode,
  }) {
    return TournamentFormState(
      name: name ?? this.name,
      type: type ?? this.type,
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
      overs: overs ?? this.overs,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }
}

final class TournamentFormInitial extends TournamentFormState {}