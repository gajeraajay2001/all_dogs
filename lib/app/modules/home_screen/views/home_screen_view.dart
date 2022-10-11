import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/modules/home_screen/views/home_add_post_widget.dart';
import 'package:all_dogs/app/modules/home_screen/views/home_latest_blog_widget.dart';
import 'package:all_dogs/app/modules/home_screen/views/home_new_arrivals_widget.dart';
import 'package:all_dogs/app/widget/drawer_widget/drawer_widget.dart';
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
    MySize().init(context);
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: Colors.white,
          endDrawer: DrawerWidget(),
          appBar: AppBar(
            leadingWidth: MySize.getWidth(200),
            toolbarHeight: MySize.getHeight(60),
            leading: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: MySize.getWidth(5)),
              child: Image.asset(
                imagePath + "logo.png",
                fit: BoxFit.cover,
                height: MySize.getHeight(60),
                width: MySize.getWidth(180),
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.black),
              ),
              InkWell(
                onTap: () {
                  controller.scaffoldKey.currentState!.openEndDrawer();
                },
                child: Container(
                  padding: EdgeInsets.only(right: MySize.getWidth(13)),
                  child: SvgPicture.asset(imagePath + "menu_icon.svg"),
                ),
              ),
            ],
          ),
          body: (controller.hasData.isFalse)
              ? Center(
                  child:
                      CircularProgressIndicator(color: appTheme.primaryTheme),
                )
              : SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        HomeAddPostWidget(),
                        Spacing.height(20),
                        HomeNewArrivalWidget(homeScreenController: controller),
                        Spacing.height(30),
                        HomeLatestBlogWidget(
                          homeScreenController: controller,
                        ),
                        Spacing.height(20),
                      ],
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
