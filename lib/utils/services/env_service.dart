
import 'package:partyspot/networking/api_urls.dart';

enum Env { dev, prod, staging}

class AppEnv {
  static Env env = Env.dev;



  static set setEnv(Env environment) {
    env = environment;
    if (environment == Env.dev) {
      ApiUrl.baseUrl = ApiUrl.devUrl;
    } else if(environment == Env.staging){
      ApiUrl.baseUrl = ApiUrl.stagingUrl;
    } else if (environment == Env.prod) {
      ApiUrl.baseUrl = ApiUrl.prodUrl;
    }
  }
}
