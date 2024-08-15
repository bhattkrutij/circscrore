import 'package:flutter/services.dart';

import '../utils/keys.dart';

class UserModel {
  String? uid;
  String? phoneNumber;
  String? name;
  String? gender;
  String? email;
  String? birthDate;
  String? city;
  String? role;
  String? battingStyle;
  String? bowlingStyle;
  UserModel(
      {this.uid,
      this.phoneNumber,
      this.name,
      this.birthDate,
      this.email,
      this.city,
      this.gender,
      this.role,
      this.bowlingStyle,
      this.battingStyle});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json[keyUid],
      phoneNumber: json[keyPhoneNumber],
      name: json[keyPhoneNumber],
      gender: json[keyGender],
      email: json[keyEmail],
      birthDate: json[keyBirthDate],
      city: json[keyCity],
      role: json[keyRole],
      bowlingStyle: json[keyBowlingStyle],
      battingStyle: json[keyBattingStyle],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[keyUid] = uid;
    data[keyPhoneNumber] = phoneNumber;
    data[keyName] = name;
    data[keyGender] = gender;
    data[keyEmail] = email;
    data[keyBirthDate] = birthDate;
    data[keyCity] = city;
    data[keyRole] = role;
    data[keyBattingStyle] = battingStyle;
    data[keyBowlingStyle] = bowlingStyle;
    return data;
  }
}