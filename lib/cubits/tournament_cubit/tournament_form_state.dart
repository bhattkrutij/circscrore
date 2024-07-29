part of 'tournament_form_cubit.dart';

@immutable
class TournamentFormState {
  final AutovalidateMode autovalidateMode;
  final String name;
  final String type;
  final String startDate;
  final String endDate;
  final String overs;
  final bool isLoading;

  const TournamentFormState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.name = "",
    this.type = "",
    this.endDate = "",
    this.startDate = "",
    this.overs = "",
    this.isLoading = false,
  });
  TournamentFormState copyWith({
    String? name,
    String? type,
    String? endDate,
    String? startDate,
    String? overs,
    AutovalidateMode? autovalidateMode,
    bool? isLoading,
  }) {
    return TournamentFormState(
      name: name ?? this.name,
      type: type ?? this.type,
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
      overs: overs ?? this.overs,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class TournamentFormInitial extends TournamentFormState {}