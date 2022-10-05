import 'package:all_dogs/app/modules/home_screen/views/home_add_post_widget.dart';
import 'package:all_dogs/app/modules/home_screen/views/home_latest_blog_widget.dart';
import 'package:all_dogs/app/modules/home_screen/views/home_new_arrivals_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../constants/api_constants.dart';
import '../../../constants/sizeConstant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetWidget<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: MySize.getWidth(150),
          leading: Container(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              imagePath + "logo.png",
              fit: BoxFit.cover,
              height: MySize.getHeight(30),
              width: MySize.getWidth(130),
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.BREEDERS_SCREEN);
              },
              icon: Icon(Icons.search, color: Colors.black),
            ),
            Container(
              padding: EdgeInsets.only(right: MySize.getWidth(13)),
              child: SvgPicture.asset(imagePath + "menu_icon.svg"),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HomeAddPostWidget(),
                Spacing.height(20),
                HomeNewArrivalWidget(),
                Spacing.height(30),
                HomeLatestBlogWidget(),
                Spacing.height(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
