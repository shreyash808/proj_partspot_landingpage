// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String? token;
  final User? user;

  LoginResponse({
    this.token,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  final String? id;
  final String? email;
  final String? fullName;
  final bool? isProfileComplete;

  User({
    this.id,
    this.email,
    this.fullName,
    this.isProfileComplete,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    fullName: json["full_name"],
    isProfileComplete: json["is_profile_complete"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "full_name": fullName,
    "is_profile_complete": isProfileComplete,
  };
}
