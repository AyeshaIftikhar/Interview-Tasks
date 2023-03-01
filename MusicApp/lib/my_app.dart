import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/Constant/routes.dart';
import 'Constant/route_names.dart';
import 'Theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: root,
      getPages: approutes,
      theme: getDefaultTheme(),
      themeMode: ThemeMode.light,
      title: 'Donquijobs',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      // themeMode: Get.find<SettingServices>().getThemeMode(),
      // theme: Get.find<SettingServices>().getLightTheme(),
      // darkTheme: Get.find<SettingServices>().getDarkTheme(),
    );
  }
}
