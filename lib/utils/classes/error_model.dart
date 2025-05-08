// class ErrorModel {
//   Error? error;
//   String? time;
//
//   ErrorModel({this.error, this.time});
//
//   ErrorModel.fromJson(Map<String, dynamic> json) {
//     error = json['error'] != null ? new Error.fromJson(json['error']) : null;
//     time = json['time'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (error != null) {
//       data['error'] = error!.toJson();
//     }
//     data['time'] = time;
//     return data;
//   }
// }
//
// class Error {
//   int? errorCode;
//   String? message;
//
//   Error({this.errorCode, this.message});
//
//   Error.fromJson(Map<String, dynamic> json) {
//     errorCode = json['errorCode'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['errorCode'] = errorCode;
//     data['message'] = message;
//     return data;
//   }
// }