// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.userPassword,
  });

  dynamic userPassword;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        userPassword: json["xpassword"],
      );

  Map<String, dynamic> toJson() => {
        "xpassword": userPassword,
      };
}
