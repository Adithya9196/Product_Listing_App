import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String name;
  String phoneNumber;

  ProfileModel({
    required this.name,
    required this.phoneNumber,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    name: json["name"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone_number": phoneNumber,
  };
}
