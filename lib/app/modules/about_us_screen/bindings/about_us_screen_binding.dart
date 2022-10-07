import 'package:get/get.dart';

import '../controllers/about_us_screen_controller.dart';

class AboutUsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutUsScreenController>(
      () => AboutUsScreenController(),
    );
  }
}
