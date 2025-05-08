import 'dart:convert';

ErrorResponse errorResponseModelFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseModelToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  int? statusCode;
  String? message;
  bool? status;
  DateTime? time;
  Error? error;

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
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "status": status,
    "time": time?.toIso8601String(),
    "error": error?.toJson(),
  };
}

class Error {
  int? status;
  String? name;
  String? message;
  String? stack;

  Error({
    this.status,
    this.name,
    this.message,
    this.stack,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    status: json["status"],
    name: json["name"],
    message: json["message"],
    stack: json["stack"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "name": name,
    "message": message,
    "stack": stack,
  };
}
