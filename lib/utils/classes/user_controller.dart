// import 'dart:developer';
// import 'package:partyspot/module/sign_in/model/user_model.dart';
// import 'package:partyspot/networking/model/error_response_model.dart';
// import 'package:partyspot/networking/network_services/auth_service.dart';
// import 'package:partyspot/service/no_network/no_network_service.dart';
// import 'package:partyspot/utils/classes/base_controller.dart';
// import 'package:partyspot/utils/constants/service_const.dart';
// import 'package:partyspot/utils/services/storage_service.dart';
//
// class UserController extends BaseController {
//   final AuthService _service = locator<AuthService>();
//   final StorageService _storageService = locator<StorageService>();
//
//   UserModel? userData;
//
//   Future<UserModel?> getMyDetails() async {
//     try {
//       setBusy(true);
//       if (_storageService.accessToken.isNotEmpty) {
//         final hasNetwork = await NoNetworkService.checkConnectivity();
//         if (hasNetwork) {
//           final res = await _service.getUserDetail();
//           userData = res?.data?.user;
//           await locator<StorageService>().setUserModel(userData);
//         } else {
//           userData = locator<StorageService>().userModel;
//         }
//         return userData;
//       }
//     } catch (e) {
//       ErrorResponse? errorResponse = e as ErrorResponse?;
//       log(errorResponse?.message.toString() ?? '');
//     } finally {
//       setBusy(false);
//     }
//     return null;
//   }
// }
