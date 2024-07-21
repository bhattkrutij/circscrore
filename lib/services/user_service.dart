import 'package:circ_scrorer/utils/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
}