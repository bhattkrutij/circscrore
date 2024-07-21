class UserModel {
  String? uid;
  String? phoneNumber;
  UserModel({this.uid, this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      phoneNumber: json['phoneNumber'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}