import 'package:bloc/bloc.dart';
import 'package:circ_scrorer/models/user_model.dart';
import 'package:circ_scrorer/services/tournament_Service.dart';
import 'package:circ_scrorer/services/user_service.dart';
import 'package:circ_scrorer/utils/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  UserService userService = UserService();
  RegisterCubit() : super(RegisterStateInitial());
  void initForm({
    String name = '',
    String birthdate = '',
    String gender = 'Male',
    String email = '',
    String city = '',
  }) {
    emit(state.copyWith(name: name, birthday: birthdate, gender: gender, email: email, city: city));
  }

  void updateName(String name) => emit(state.copyWith(name: name));
  void updateBirthday(String birthday) => emit(state.copyWith(birthday: birthday));
  void updateGender(String gender) => emit(state.copyWith(gender: gender));
  void updateEmail(String email) => emit(state.copyWith(email: email));
  void updateCity(String city) => emit(state.copyWith(city: city));

  void nextStep() {
    if (state.currentStep < 4) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void updatePlayerDetails({required User user}) {
    UserModel userModel = UserModel();
    userModel.uid = user.uid;
    userModel.phoneNumber = user.phoneNumber;
    userModel.gender = state.gender;
    userModel.city = state.city;
    userModel.email = state.email;
    userModel.name = state.name;
    userModel.birthDate = state.birthday;
    userService.updateUserData(phoneNumber: user.phoneNumber.toString(), userModel: userModel).then((value) {
      if (value) {
        emit(RegisterationCompletedState("Registration completed successfully"));
      } else {
        emit(ErrorState("something went wrong"));
      }
    });
  }
}