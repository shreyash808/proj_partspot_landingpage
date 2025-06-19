// To parse this JSON data, do
//
//     final phoneLoginResponse = phoneLoginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:partyspot/module/login/data/models/login_response_model.dart';

UserLoginResponse userLoginResponseFromJson(String str) => UserLoginResponse.fromJson(json.decode(str));

String userLoginResponseToJson(UserLoginResponse data) => json.encode(data.toJson());

class UserLoginResponse {
  final int? statusCode;
  final String? message;
  final User? data;

  UserLoginResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => UserLoginResponse(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : User.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

