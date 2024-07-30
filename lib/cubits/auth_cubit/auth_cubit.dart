import 'package:circ_scrorer/utils/keys.dart';
import 'package:circ_scrorer/utils/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/user_service.dart';
import '../../models/user_model.dart';
import '../../utils/shared_pref.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserService userService = UserService();
  AuthCubit() : super(AuthInitianState());

  String? verificationID;

  void sendOTP(String phoneNumber) async {
    emit(AuthLoadingState());
    try {
      _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeSent: (verificationId, forceResendingToken) {
          verificationID = verificationId;
          emit(AuthCodeSentState());
        },
        verificationCompleted: (phoneAuthCredential) {
          signInWithPhone(phoneAuthCredential);
        },
        verificationFailed: (error) {
          emit(AuthErrorState(error.message.toString()));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          verificationID = verificationId;
        },
      );
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  void verifyOTP(String otp) async {
    emit(AuthLoadingState());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID!, smsCode: otp);
    signInWithPhone(credential);
  }

  void signInWithPhone(AuthCredential credential) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user != null) {
        await userService.isUserExist(user.phoneNumber).then((value) async {
          if (value) {
            await userService.getUserByPhoneNumber(phoneNumber: user.phoneNumber).then((value) {
              setValue(currentUser, value.toJson());
              setValue(isUserLoggedIn, true);
              emit(AuthLoggedInState(userCredential.user!));
            });
          } else {
            UserModel userModel = UserModel();
            userModel.uid = user.uid;
            userModel.phoneNumber = user.phoneNumber;
            await userService.addUser(userModel.toJson());
            emit(AuthCompleteUserProfileState(userCredential.user!));
            toast("new user registration");
          }
        });
      }
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
  }

  void logOut() async {
    _firebaseAuth.signOut();
    emit(AuthLoggedOutState());
  }
}