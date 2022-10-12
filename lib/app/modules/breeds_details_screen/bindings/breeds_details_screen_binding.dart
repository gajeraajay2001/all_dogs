import 'package:get/get.dart';

import '../controllers/breeds_details_screen_controller.dart';

class BreedsDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreedsDetailsScreenController>(
      () => BreedsDetailsScreenController(),
    );
  }
}
