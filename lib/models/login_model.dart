// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.uid,
    required this.xpassword,
  });

  dynamic uid;
  dynamic xpassword;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        uid: json["uid"],
        xpassword: json["xpassword"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "xpassword": xpassword,
      };
}
