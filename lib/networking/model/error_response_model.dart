import 'dart:convert';

ErrorResponse errorResponseModelFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseModelToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  int? statusCode;
  String? message;
  bool? status;
  DateTime? time;
  String? error;

  ErrorResponse({
    this.statusCode,
    this.message,
    this.status,
    this.time,
    this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    statusCode: json["statusCode"],
    message: json["message"],
    status: json["status"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "status": status,
    "time": time?.toIso8601String(),
    "error": error,
  };
}

