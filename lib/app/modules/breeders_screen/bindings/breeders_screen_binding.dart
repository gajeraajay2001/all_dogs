import 'package:get/get.dart';

import '../controllers/breeders_screen_controller.dart';

class BreedersScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreedersScreenController>(
      () => BreedersScreenController(),
    );
  }
}
