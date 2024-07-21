import 'package:circ_scrorer/utils/firebase_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/user_service.dart';
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
        // Store user data in Firestore
        final Map<String, dynamic> userData = {
          keyUid: user.uid,
          keyPhoneNumber: user.phoneNumber,
        };
        await userService.addUser(userData);

        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
  }

  void logOut() async {
    emit(AuthLoggedOutState());
    _firebaseAuth.signOut();
  }
}