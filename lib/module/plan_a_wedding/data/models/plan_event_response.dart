// To parse this JSON data, do
//
//     final planEventResponse = planEventResponseFromJson(jsonString);

import 'dart:convert';

PlanEventResponse planEventResponseFromJson(String str) => PlanEventResponse.fromJson(json.decode(str));

String planEventResponseToJson(PlanEventResponse data) => json.encode(data.toJson());

class PlanEventResponse {
  final String? message;
  final Booking? booking;

  PlanEventResponse({
    this.message,
    this.booking,
  });

  factory PlanEventResponse.fromJson(Map<String, dynamic> json) => PlanEventResponse(
    message: json["message"],
    booking: json["booking"] == null ? null : Booking.fromJson(json["booking"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "booking": booking?.toJson(),
  };
}

class Booking {
  final String? eventId;
  final String? userId;
  final int? guests;
  final String? id;
  final AssignedAgent? assignedAgent;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Booking({
    this.eventId,
    this.userId,
    this.guests,
    this.id,
    this.assignedAgent,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    eventId: json["eventId"],
    userId: json["userId"],
    guests: json["guests"],
    id: json["_id"],
    assignedAgent: json["assignedAgent"] == null ? null : AssignedAgent.fromJson(json["assignedAgent"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "eventId": eventId,
    "userId": userId,
    "guests": guests,
    "_id": id,
    "assignedAgent": assignedAgent?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class AssignedAgent {
  final dynamic fullName;
  final dynamic email;
  final dynamic profilePictureUrl;
  final dynamic deviceToken;
  final dynamic about;
  final dynamic designation;
  final dynamic dob;
  final String? id;
  final int? phone;
  final String? gender;
  final bool? isEmailVerified;
  final bool? isNumberVerified;
  final bool? isProfileComplete;
  final bool? isDeleted;
  final dynamic otp;
  final String? code;
  final String? userType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  AssignedAgent({
    this.fullName,
    this.email,
    this.profilePictureUrl,
    this.deviceToken,
    this.about,
    this.designation,
    this.dob,
    this.id,
    this.phone,
    this.gender,
    this.isEmailVerified,
    this.isNumberVerified,
    this.isProfileComplete,
    this.isDeleted,
    this.otp,
    this.code,
    this.userType,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AssignedAgent.fromJson(Map<String, dynamic> json) => AssignedAgent(
    fullName: json["full_name"],
    email: json["email"],
    profilePictureUrl: json["profilePictureUrl"],
    deviceToken: json["deviceToken"],
    about: json["about"],
    designation: json["designation"],
    dob: json["dob"],
    id: json["_id"],
    phone: json["phone"],
    gender: json["gender"],
    isEmailVerified: json["isEmailVerified"],
    isNumberVerified: json["isNumberVerified"],
    isProfileComplete: json["isProfileComplete"],
    isDeleted: json["isDeleted"],
    otp: json["otp"],
    code: json["code"],
    userType: json["userType"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "email": email,
    "profilePictureUrl": profilePictureUrl,
    "deviceToken": deviceToken,
    "about": about,
    "designation": designation,
    "dob": dob,
    "_id": id,
    "phone": phone,
    "gender": gender,
    "isEmailVerified": isEmailVerified,
    "isNumberVerified": isNumberVerified,
    "isProfileComplete": isProfileComplete,
    "isDeleted": isDeleted,
    "otp": otp,
    "code": code,
    "userType": userType,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
