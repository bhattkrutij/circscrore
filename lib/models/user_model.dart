class UserModel {
  String? uid;
  String? phoneNumber;
  String? name;
  String? gender;
  String? email;
  String? birthDate;
  String? city;
  UserModel({
    this.uid,
    this.phoneNumber,
    this.name,
    this.birthDate,
    this.email,
    this.city,
    this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      gender: json['gender'],
      email: json['email'],
      birthDate: json['birthDate'],
      city: json['city'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['phoneNumber'] = phoneNumber;
    data['name'] = name;
    data['gender'] = gender;
    data['email'] = email;
    data['birthDate'] = birthDate;
    data['city'] = city;
    return data;
  }
}