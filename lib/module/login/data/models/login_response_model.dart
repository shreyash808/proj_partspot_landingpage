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
  final String? gender;
  final bool? isEmailVerified;
  final bool? isNumberVerified;
  final bool? isProfileComplete;
  final bool? isDeleted;
  final int? v;
  final String? deviceToken;
  final String? email;
  final String? fullName;
  final String? profilePictureUrl;
  final String? otp;
  final String? code;
  final DateTime? updatedAt;
  final DateTime? dob;

  User({
    this.id,
    this.phone,
    this.gender,
    this.isEmailVerified,
    this.isNumberVerified,
    this.isProfileComplete,
    this.isDeleted,
    this.v,
    this.deviceToken,
    this.email,
    this.fullName,
    this.profilePictureUrl,
    this.otp,
    this.code,
    this.updatedAt,
    this.dob
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    phone: json["phone"],
    gender: json["gender"],
    isEmailVerified: json["isEmailVerified"],
    isNumberVerified: json["isNumberVerified"],
    isProfileComplete: json["isProfileComplete"],
    isDeleted: json["isDeleted"],
    v: json["__v"],
    deviceToken: json["deviceToken"],
    email: json["email"],
    fullName: json["full_name"],
    profilePictureUrl: json["profilePictureUrl"],
    otp: json["otp"],
    code: json["code"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "phone": phone,
    "gender": gender,
    "isEmailVerified": isEmailVerified,
    "isNumberVerified": isNumberVerified,
    "isProfileComplete": isProfileComplete,
    "isDeleted": isDeleted,
    "__v": v,
    "deviceToken": deviceToken,
    "email": email,
    "full_name": fullName,
    "profilePictureUrl": profilePictureUrl,
    "otp": otp,
    "code": code,
    "updatedAt": updatedAt?.toIso8601String(),
    "dob": dob?.toIso8601String(),
  };
}
