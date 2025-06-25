// To parse this JSON data, do
//
//     final fileUploadResponse = fileUploadResponseFromJson(jsonString);

import 'dart:convert';

FileUploadResponse fileUploadResponseFromJson(String str) => FileUploadResponse.fromJson(json.decode(str));

String fileUploadResponseToJson(FileUploadResponse data) => json.encode(data.toJson());

class FileUploadResponse {
  final int? statusCode;
  final String? message;
  final Data? data;

  FileUploadResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory FileUploadResponse.fromJson(Map<String, dynamic> json) => FileUploadResponse(
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
  final String? key;
  final String? url;

  Data({
    this.key,
    this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    key: json["key"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "url": url,
  };
}
