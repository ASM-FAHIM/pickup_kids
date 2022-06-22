// To parse this JSON data, do
//
//     final getChildModel = getChildModelFromJson(jsonString);

import 'dart:convert';

List<GetChildModel> getChildModelFromJson(String str) =>
    List<GetChildModel>.from(
        json.decode(str).map((x) => GetChildModel.fromJson(x)));

String getChildModelToJson(List<GetChildModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetChildModel {
  GetChildModel({
    required this.childName,
    required this.childClass,
    required this.childRoll,
    required this.fatherName,
    required this.motherName,
    required this.uid,
    required this.pickerName,
    required this.driverName,
    required this.carNumplate,
    required this.childImage,
    required this.ximage,
    required this.carImage,
  });

  String childName;
  String childClass;
  String childRoll;
  String fatherName;
  String motherName;
  String uid;
  String pickerName;
  String driverName;
  String carNumplate;
  String childImage;
  String ximage;
  String carImage;

  factory GetChildModel.fromJson(Map<String, dynamic> json) => GetChildModel(
        childName: json["child_name"],
        childClass: json["child_class"],
        childRoll: json["child_roll"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        uid: json["uid"],
        pickerName: json["picker_name"],
        driverName: json["driver_name"],
        carNumplate: json["car_numplate"],
        childImage: json["child_image"],
        ximage: json["ximage"],
        carImage: json["car_image"],
      );

  Map<String, dynamic> toJson() => {
        "child_name": childName,
        "child_class": childClass,
        "child_roll": childRoll,
        "father_name": fatherName,
        "mother_name": motherName,
        "uid": uid,
        "picker_name": pickerName,
        "driver_name": driverName,
        "car_numplate": carNumplate,
        "child_image": childImage,
        "ximage": ximage,
        "car_image": carImage,
      };
}
