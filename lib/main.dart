import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:partyspot/firebase_options.dart';
import 'package:partyspot/module/login/data/auth_repository_impl.dart';
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/routes/app_routes.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/services/env_service.dart';
import 'package:partyspot/utils/services/storage_service.dart';

import 'package:partyspot/utils/theme/light_theme.dart';

import 'networking/dio_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _setupRepo();
  await _setupService();
  runApp(const MyApp());
}
_setupService(){
  AppEnv.setEnv = Env.dev;
  locator.registerLazySingleton<DioInjector>(() => DioInjector());
  locator.registerLazySingleton<StorageService>(() => StorageService());

}
_setupRepo(){
  locator.registerLazySingleton<AuthRepository>(()=>AuthRepositoryImpl());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final lightTheme = LightTheme();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      getPages: AppRoutes.getRoutes(),
      title: 'Party Spot',
      theme: lightTheme.themeData(context),
    );
  }
}
