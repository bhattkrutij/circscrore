import 'package:circ_scrorer/utils/shared_pref.dart';
import 'package:circ_scrorer/utils/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';
import '../utils/keys.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(Map<String, dynamic> userData) async {
    try {
      await _firestore.collection(usersCollection).doc(userData[keyUid]).set(userData);
    } catch (e) {
      toast(e.toString());
      throw Exception('Error adding user to Firestore: $e');
    }
  }

  Future<bool> isUserExist(String? phoneNumber) async {
    Query query = _firestore.collection(usersCollection).where(keyPhoneNumber, isEqualTo: phoneNumber);
    var res = await query.get();

    // ignore: unnecessary_null_comparison
    if (res.docs != null) {
      return res.docs.length == 1;
    } else {
      return false;
    }
  }

  Future<UserModel> getUserByPhoneNumber({required String? phoneNumber}) {
    return _firestore.collection(usersCollection).where(keyPhoneNumber, isEqualTo: phoneNumber).get().then((value) {
      if (value.docs.length == 1) {
        return UserModel.fromJson(value.docs.first.data() as Map<String, dynamic>);
      } else {
        throw 'User Not found';
      }
    });
  }

  Future<bool> updateUserData({required String phoneNumber, required UserModel userModel}) async {
    try {
      DocumentReference userDocRef = _firestore.collection(usersCollection).doc(userModel.uid);
      await userDocRef.update(userModel.toJson());
      setValue(currentUser, userModel.toJson());
      setValue(isUserLoggedIn, true);
      return true;
    } catch (e) {
      print('Error updating user data: $e');
      throw "Error while updating user data";

      // Add appropriate error handling logic
    }
  }
}