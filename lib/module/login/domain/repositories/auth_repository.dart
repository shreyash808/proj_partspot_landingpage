import 'package:partyspot/module/login/data/models/login_response_model.dart';
import 'package:partyspot/module/login/data/models/phone_login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse?> socialLogin({required String? provider,required String? idToken,String? pushToken});
  Future<PhoneLoginResponse?> phoneLogin({required String? phoneNumber});
  Future<LoginResponse?> verifyOTP({required String? phoneNumber,required String? otp,String? pushToken});
}
