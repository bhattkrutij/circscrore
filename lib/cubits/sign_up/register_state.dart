import '../../utils/app_strings.dart';

class RegisterState {
  final String name;
  final String? birthday;
  final String gender;
  final String email;
  final String city;
  final String role;
  final String battingStyle;
  final String bowlingStyle;
  final int currentStep;

  RegisterState({
    this.name = '',
    this.birthday,
    this.gender = male,
    this.email = '',
    this.city = '',
    this.role = '',
    this.battingStyle =battingStyleLeftHand,
    this.bowlingStyle = bowlerStyleLeftArmFast,
    this.currentStep = 0,
  });

  RegisterState copyWith({
    String? name,
    String? birthday,
    String? gender,
    String? email,
    String? city,
    String? role,
    String? battingStyle,
    String? bowlingStyle,
    int? currentStep,
  }) {
    return RegisterState(
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      city: city ?? this.city,
      role: role ?? this.role,
      currentStep: currentStep ?? this.currentStep,
    );
  }
}

final class RegisterStateInitial extends RegisterState {}

final class RegisterationCompletedState extends RegisterState {
  String msg;
  RegisterationCompletedState(this.msg);
}

final class ErrorState extends RegisterState {
  String msg;
  ErrorState(this.msg);
}