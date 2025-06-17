
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
  Future<PhoneLoginResponse?> phoneLogin({String? code,int? phoneNumber}) async {
    final response = await postRequest(ApiUrl.loginPhone, data: {
      'code': code,
      'phone': phoneNumber,
    });
    return PhoneLoginResponse.fromJson(response.data);
  }

  @override
  Future<PhoneLoginResponse?> resendOtp({String? code,int? phoneNumber}) async {
    final response = await postRequest(ApiUrl.resendOtp, data: {
      'code': code,
      'phone': phoneNumber,
    });
    return PhoneLoginResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse?> verifyOTP({required String? code,required int? phoneNumber,required String? otp,String? pushToken}) async {
    final response = await postRequest(ApiUrl.verifyOtp, data: {
      'code': code,
      'phone': phoneNumber,
      'otp': otp,
      // if(pushToken?.isNotEmpty ?? false) 'device_token': pushToken,
    });
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse?> updateProfile({String? fullName,String? gender,String? profilePicture,String? deviceToken}) async {
    final response = await putRequest(ApiUrl.profile, data: {
      'full_name': fullName,
      'gender': gender,
      'deviceToken': deviceToken,
      'profilePictureUrl': profilePicture
    });
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse?> userDetail() async {
    final response = await getRequest(ApiUrl.profile);
    return LoginResponse.fromJson(response.data);
  }

}
