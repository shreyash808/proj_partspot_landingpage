import 'package:partyspot/module/login/data/models/login_response_model.dart';

abstract class LoginRepository {
  Future<LoginResponse?> socialLogin({String? provider,String? idToken,String? pushToken});
}
