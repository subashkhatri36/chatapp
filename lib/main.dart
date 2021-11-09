import 'package:chatdemoapp/src/common/constant/strings.dart';
import 'package:chatdemoapp/src/common/themes/theme_data.dart';
import 'package:chatdemoapp/src/initial_bindings.dart';
import 'package:chatdemoapp/src/modules/splash/splash_screen_page.dart';
import 'package:chatdemoapp/src/utils/helpers/logger_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: Themes.light,
      initialBinding: InitialBinding(),
      home: const SplashPage(),
      enableLog: true,
      logWriterCallback: LoggerHelper.write,
    );
  }
}

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
