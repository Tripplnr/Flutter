// To parse this JSON data, do
//
//     final socialLoginModel = socialLoginModelFromJson(jsonString);

import 'dart:convert';

SocialLoginModel socialLoginModelFromJson(String str) =>
    SocialLoginModel.fromJson(json.decode(str));

String socialLoginModelToJson(SocialLoginModel data) =>
    json.encode(data.toJson());

class SocialLoginModel {
  SocialLoginModel({
    this.success,
    this.status,
    this.token,
    this.message,
  });

  bool? success;
  int? status;
  String? token;
  String? message;

  factory SocialLoginModel.fromJson(Map<String, dynamic> json) =>
      SocialLoginModel(
        success: json["success"],
        status: json["status"],
        token: json["token"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "token": token,
        "message": message,
      };
}
