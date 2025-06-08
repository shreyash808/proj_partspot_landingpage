// To parse this JSON data, do
//
//     final phoneLoginResponse = phoneLoginResponseFromJson(jsonString);

import 'dart:convert';

PhoneLoginResponse phoneLoginResponseFromJson(String str) => PhoneLoginResponse.fromJson(json.decode(str));

String phoneLoginResponseToJson(PhoneLoginResponse data) => json.encode(data.toJson());

class PhoneLoginResponse {
  final String? message;
  final String? otp;

  PhoneLoginResponse({
    this.message,
    this.otp,
  });

  factory PhoneLoginResponse.fromJson(Map<String, dynamic> json) => PhoneLoginResponse(
    message: json["message"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "otp": otp,
  };
}
