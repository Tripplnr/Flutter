// To parse this JSON data, do
//
//     final likeBlogModel = likeBlogModelFromJson(jsonString);

import 'dart:convert';

LikeBlogModel likeBlogModelFromJson(String str) =>
    LikeBlogModel.fromJson(json.decode(str));

String likeBlogModelToJson(LikeBlogModel data) => json.encode(data.toJson());

class LikeBlogModel {
  LikeBlogModel({
    this.success,
    this.status,
    this.message,
  });

  bool? success;
  int? status;
  String? message;

  factory LikeBlogModel.fromJson(Map<String, dynamic> json) => LikeBlogModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
      };
}
