import 'package:chatdemoapp/src/modules/home/home_screen_page.dart';
import 'package:chatdemoapp/src/modules/splash/widget/base_splash.dart';
import 'package:chatdemoapp/src/utils/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ///animation duration
  int duration = 2;

  @override
  void initState() {
    super.initState();
    Future.delayed(duration.seconds, getNextPage);
  }

  ///check for authentication and go to next page
  void getNextPage() async {
    Get.off(() => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(body: SafeArea(child: BaseSplash()));
  }
}
