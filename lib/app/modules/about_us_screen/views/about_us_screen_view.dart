import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/about_us_screen_controller.dart';

class AboutUsScreenView extends GetWidget<AboutUsScreenController> {
  const AboutUsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text(
              'About Us',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: (controller.hasData.isFalse)
              ? Center(
                  child:
                      CircularProgressIndicator(color: appTheme.primaryTheme),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MySize.getHeight(15),
                        horizontal: MySize.getWidth(20)),
                    child: Column(
                      children: [
                        Html(
                            data: controller.data.value,
                            onLinkTap: (val, context, a, b) {
                              launchUrl(Uri.parse(val.toString()));
                            }),
                      ],
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
