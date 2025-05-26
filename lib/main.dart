import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:partyspot/firebase_options.dart';
import 'package:partyspot/routes/app_routes.dart';
import 'package:partyspot/routes/routes_const.dart';

import 'package:partyspot/utils/theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final lightTheme = LightTheme();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.appEntryScreen,

      getPages: AppRoutes.getRoutes(),
      title: 'Party Spot',
      theme: lightTheme.themeData(context),
    );
  }
}
