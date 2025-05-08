// To parse this JSON data, do
//
//     final successResponseModel = successResponseModelFromJson(jsonString);

import 'dart:convert';

SuccessResponseModel successResponseModelFromJson(String str) => SuccessResponseModel.fromJson(json.decode(str));

String successResponseModelToJson(SuccessResponseModel data) => json.encode(data.toJson());

class SuccessResponseModel {
  int? statusCode;
  bool? status;
  String? message;
  DateTime? time;
  bool? success;
  Map<String, dynamic>? data;

  SuccessResponseModel({this.statusCode, this.status, this.message, this.time, this.data,this.success});

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) => SuccessResponseModel(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: json['data'],
        success: json['success'],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": data,
        "success": success,
        "time": time?.toIso8601String(),
      };
}
