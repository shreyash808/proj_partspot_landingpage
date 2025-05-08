import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:partyspot/routes/app_routes.dart';
import 'package:partyspot/utils/common_utils.dart';
import 'package:partyspot/utils/theme/light_theme.dart';

void main() {
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
      initialRoute: '/',
      getPages: AppRoutes.getRoutes(),
      title: 'Party Spot',
      theme: lightTheme.themeData(context),
    );
  }
}
