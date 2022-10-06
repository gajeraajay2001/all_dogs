import 'package:get/get.dart';

import '../controllers/breeds_screen_controller.dart';

class BreedsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreedsScreenController>(
      () => BreedsScreenController(),
    );
  }
}
