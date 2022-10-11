import 'package:get/get.dart';

import '../controllers/blog_details_screen_controller.dart';

class BlogDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogDetailsScreenController>(
      () => BlogDetailsScreenController(),
    );
  }
}
