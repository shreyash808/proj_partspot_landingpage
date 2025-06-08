
import 'package:partyspot/module/login/data/models/login_response_model.dart';
import 'package:partyspot/module/login/data/models/phone_login_response.dart';
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class AuthRepositoryImpl extends PartySportApiService implements AuthRepository {

  @override
  Future<LoginResponse?> socialLogin({String? provider,String? idToken,String? pushToken}) async {
    final response = await postRequest(ApiUrl.socialLogin, data: {
      'provider': provider,
      'id_token': idToken,
      if(pushToken?.isNotEmpty ?? false) 'device_token': pushToken
    });
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<PhoneLoginResponse?> phoneLogin({String? phoneNumber}) async {
    final response = await postRequest(ApiUrl.loginPhone, data: {
      'phone_number': phoneNumber,
    });
    return PhoneLoginResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse?> verifyOTP({String? phoneNumber,String? otp,String? pushToken}) async {
    final response = await postRequest(ApiUrl.verifyOtp, data: {
      'phone_number': phoneNumber,
      'otp': otp,
      if(pushToken?.isNotEmpty ?? false) 'device_token': pushToken,
    });
    return LoginResponse.fromJson(response.data);
  }

}
