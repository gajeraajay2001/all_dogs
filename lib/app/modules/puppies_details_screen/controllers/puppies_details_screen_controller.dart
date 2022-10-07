import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PuppiesDetailsScreenController extends GetxController {
  CarouselController carouselController = CarouselController();
  RxInt selectedBannerIndex = 0.obs;
  RxList bannerList =
      RxList(["dog01.jpeg", "dog02.jpeg", "dog03.jpeg", "dog04.jpeg"]);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
