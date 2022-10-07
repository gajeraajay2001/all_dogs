import 'package:get/get.dart';

import '../controllers/get_in_touch_screen_controller.dart';

class GetInTouchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetInTouchScreenController>(
      () => GetInTouchScreenController(),
    );
  }
}
