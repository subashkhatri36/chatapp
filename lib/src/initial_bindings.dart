import 'package:chatdemoapp/src/core/controllers/home_page_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() async {
    // await Get.putAsync<HttpService>(
    //   () => HttpService().init(),
    //   // permanent: true,
    // );

    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );

    // Get.lazyPut<CameraImageController>(
    //   () => CameraImageController(),
    //   fenix: true,
    // );

    // Get.lazyPut<DashboardController>(
    //   () => DashboardController(),
    //   fenix: true,
    // );
  }
}
