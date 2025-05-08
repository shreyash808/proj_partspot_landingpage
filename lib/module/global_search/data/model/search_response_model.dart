// // To parse this JSON data, do
// //
// //     final searchResponse = searchResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));
//
// String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());
//
// class SearchResponse {
//   int? statusCode;
//   bool? status;
//   String? message;
//   DateTime? time;
//   Data? data;
//
//   SearchResponse({
//     this.statusCode,
//     this.status,
//     this.message,
//     this.time,
//     this.data,
//   });
//
//   factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
//     statusCode: json["statusCode"],
//     status: json["status"],
//     message: json["message"],
//     time: json["time"] == null ? null : DateTime.parse(json["time"]),
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "statusCode": statusCode,
//     "status": status,
//     "message": message,
//     "time": time?.toIso8601String(),
//     "data": data?.toJson(),
//   };
// }
//
// class Data {
//   List<Result>? result;
//   int? totalCount;
//   bool? hashNext;
//
//   Data({
//     this.result,
//     this.totalCount,
//     this.hashNext,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
//     totalCount: json["totalCount"],
//     hashNext: json["hashNext"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
//     "totalCount": totalCount,
//     "hashNext": hashNext,
//   };
// }
//
// class Result {
//   String? id;
//   String? profilePic;
//   String? firstName;
//   String? lastName;
//   String? username;
//   int? followersCount;
//   int? followStatus;
//   bool? blockedStatus;
//   int? storiesViewedStatus;
//
//   Result({
//     this.id,
//     this.profilePic,
//     this.firstName,
//     this.lastName,
//     this.username,
//     this.followersCount,
//     this.followStatus,
//     this.blockedStatus,
//     this.storiesViewedStatus,
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["_id"],
//     profilePic: json["profilePic"],
//     firstName: json["firstName"],
//     lastName: json["lastName"],
//     username: json["username"],
//     followersCount: json["followersCount"],
//     followStatus: json["followStatus"],
//     blockedStatus: json["blockedStatus"],
//     storiesViewedStatus: json["storiesViewedStatus"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "profilePic": profilePic,
//     "firstName": firstName,
//     "lastName": lastName,
//     "username": username,
//     "followersCount": followersCount,
//     "followStatus": followStatus,
//     "blockedStatus": blockedStatus,
//     "storiesViewedStatus": storiesViewedStatus,
//   };
// }
