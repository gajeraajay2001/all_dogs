import 'package:get/get.dart';

import '../controllers/create_add_controller.dart';

class CreateAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAddController>(
      () => CreateAddController(),
    );
  }
}
