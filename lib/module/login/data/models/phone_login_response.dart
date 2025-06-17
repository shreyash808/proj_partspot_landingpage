// To parse this JSON data, do
//
//     final phoneLoginResponse = phoneLoginResponseFromJson(jsonString);

import 'dart:convert';

PhoneLoginResponse phoneLoginResponseFromJson(String str) => PhoneLoginResponse.fromJson(json.decode(str));

String phoneLoginResponseToJson(PhoneLoginResponse data) => json.encode(data.toJson());

class PhoneLoginResponse {
  final int? statusCode;
  final String? message;
  final Data? data;

  PhoneLoginResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory PhoneLoginResponse.fromJson(Map<String, dynamic> json) => PhoneLoginResponse(
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
  final int? phone;
  final String? gender;
  final bool? isEmailVerified;
  final bool? isNumberVerified;
  final bool? isProfileComplete;
  final bool? isDeleted;
  final String? otp;
  final String? code;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Data({
    this.phone,
    this.gender,
    this.isEmailVerified,
    this.isNumberVerified,
    this.isProfileComplete,
    this.isDeleted,
    this.otp,
    this.code,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    phone: json["phone"],
    gender: json["gender"],
    isEmailVerified: json["isEmailVerified"],
    isNumberVerified: json["isNumberVerified"],
    isProfileComplete: json["isProfileComplete"],
    isDeleted: json["isDeleted"],
    otp: json["otp"],
    code: json["code"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "gender": gender,
    "isEmailVerified": isEmailVerified,
    "isNumberVerified": isNumberVerified,
    "isProfileComplete": isProfileComplete,
    "isDeleted": isDeleted,
    "otp": otp,
    "code": code,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
