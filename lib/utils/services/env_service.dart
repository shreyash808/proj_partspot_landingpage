
import 'package:partyspot/networking/api_urls.dart';

enum Env { dev, prod, staging}

class AppEnv {
  static Env env = Env.dev;



  static set setEnv(Env environment) {
    env = environment;
    if (environment == Env.dev) {
      ApiUrl.baseUrl = ApiUrl.devUrl;
      ApiUrl.socketUrl = ApiUrl.socketDevUrl;
    } else if(environment == Env.staging){
      ApiUrl.baseUrl = ApiUrl.stagingUrl;
      ApiUrl.socketUrl = ApiUrl.socketStagUrl;
    } else if (environment == Env.prod) {
      ApiUrl.baseUrl = ApiUrl.prodUrl;
      ApiUrl.socketUrl = ApiUrl.socketProdUrl;
    }
  }
}
