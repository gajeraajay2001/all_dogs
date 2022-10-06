import 'package:get/get.dart';

import '../controllers/blogs_screen_controller.dart';

class BlogsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogsScreenController>(
      () => BlogsScreenController(),
    );
  }
}
