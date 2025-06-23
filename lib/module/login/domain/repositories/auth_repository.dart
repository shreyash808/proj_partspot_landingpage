import 'package:partyspot/module/login/data/models/login_response_model.dart';
import 'package:partyspot/module/login/data/models/phone_login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse?> socialLogin({required String? provider,required String? idToken,String? pushToken});
  Future<UserLoginResponse?> phoneLogin({required String? code,required int? phoneNumber});
  Future<LoginResponse?> verifyOTP({required String? code,required int? phoneNumber,required String? otp,String? pushToken});
  Future<UserLoginResponse?> resendOtp({required String? code,required int? phoneNumber});
  Future<LoginResponse?> updateProfile({String? fullName,String? gender,String? profilePicture,String? deviceToken,String? dob,String? email});
  Future<LoginResponse?> userDetail();
}
