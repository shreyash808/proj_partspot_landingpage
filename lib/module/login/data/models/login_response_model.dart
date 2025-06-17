// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final int? statusCode;
  final String? message;
  final Data? data;

  LoginResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final User? user;
  final String? accessToken;

  Data({
    this.user,
    this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "access_token": accessToken,
  };
}

class User {
  final String? id;
  final int? phone;
  final dynamic otp;
  final String? code;
  final bool? isNumberVerified;
  final DateTime? updatedAt;

  User({
    this.id,
    this.phone,
    this.otp,
    this.code,
    this.isNumberVerified,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    phone: json["phone"],
    otp: json["otp"],
    code: json["code"],
    isNumberVerified: json["isNumberVerified"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "phone": phone,
    "otp": otp,
    "code": code,
    "isNumberVerified": isNumberVerified,
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
