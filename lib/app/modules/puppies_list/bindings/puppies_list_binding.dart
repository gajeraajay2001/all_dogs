import 'package:get/get.dart';

import '../controllers/puppies_list_controller.dart';

class PuppiesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PuppiesListController>(
      () => PuppiesListController(),
    );
  }
}
