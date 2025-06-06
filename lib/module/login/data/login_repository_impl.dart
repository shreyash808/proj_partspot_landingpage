
import 'package:partyspot/module/login/data/models/login_response_model.dart';
import 'package:partyspot/module/login/domain/repositories/login_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class LoginRepositoryImpl extends PartySportApiService implements LoginRepository {

  @override
  Future<LoginResponse?> socialLogin({String? provider,String? idToken,String? pushToken}) async {
    final response = await postRequest(ApiUrl.socialLogin, data: {
      'provider': provider,
      'id_token': idToken,
      if(pushToken?.isNotEmpty ?? false) 'device_token': pushToken
    });
    return LoginResponse.fromJson(response.data);
  }

}
