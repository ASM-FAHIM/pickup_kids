// To parse this JSON data, do
//
//     final uidModel = uidModelFromJson(jsonString);

import 'dart:convert';

UidModel uidModelFromJson(String str) => UidModel.fromJson(json.decode(str));

String uidModelToJson(UidModel data) => json.encode(data.toJson());

class UidModel {
  UidModel({
    required this.uid,
  });

  String uid;

  factory UidModel.fromJson(Map<String, dynamic> json) => UidModel(
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
      };
}
