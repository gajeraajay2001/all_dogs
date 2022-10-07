import 'package:get/get.dart';

import '../controllers/puppies_details_screen_controller.dart';

class PuppiesDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PuppiesDetailsScreenController>(
      () => PuppiesDetailsScreenController(),
    );
  }
}
