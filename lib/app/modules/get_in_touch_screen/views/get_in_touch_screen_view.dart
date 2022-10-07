import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/utilities/buttons.dart';
import 'package:all_dogs/app/utilities/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/get_in_touch_screen_controller.dart';

class GetInTouchScreenView extends GetWidget<GetInTouchScreenController> {
  const GetInTouchScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            'Get in Touch',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Feel free to drop us a line below!",
                    style: TextStyle(
                        fontSize: MySize.getHeight(10),
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Spacing.height(5),
                Center(
                  child: Text(
                    "alphas@alldogs.in",
                    style: TextStyle(
                        fontSize: MySize.getHeight(10),
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Spacing.height(20),
                Text(
                  "NAME",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Spacing.height(15),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 7),
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: MySize.getHeight(13),
                        spreadRadius: MySize.getHeight(2),
                      ),
                    ],
                  ),
                  child: getTextField(
                    hintText: "Full Name",
                    borderColor: Colors.transparent,
                    size: 70,
                    isFilled: true,
                    fillColor: Colors.white,
                    textEditingController: controller.nameController,
                  ),
                ),
                Spacing.height(30),
                Text(
                  "E-MAIL",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Spacing.height(15),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 7),
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: MySize.getHeight(13),
                        spreadRadius: MySize.getHeight(2),
                      ),
                    ],
                  ),
                  child: getTextField(
                    hintText: "Your E-Mail",
                    borderColor: Colors.transparent,
                    size: 70,
                    isFilled: true,
                    fillColor: Colors.white,
                    textEditingController: controller.mailController,
                  ),
                ),
                Spacing.height(30),
                Text(
                  "PHONE",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Spacing.height(15),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 7),
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: MySize.getHeight(13),
                        spreadRadius: MySize.getHeight(2),
                      ),
                    ],
                  ),
                  child: getTextField(
                    hintText: "1-234-567-8901",
                    borderColor: Colors.transparent,
                    size: 70,
                    isFilled: true,
                    fillColor: Colors.white,
                    textInputType: TextInputType.number,
                    textEditingController: controller.phoneNumberController,
                  ),
                ),
                Spacing.height(30),
                Text(
                  "MESSAGE",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Spacing.height(15),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 7),
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: MySize.getHeight(13),
                        spreadRadius: MySize.getHeight(2),
                      ),
                    ],
                  ),
                  child: getTextField(
                    hintText: "Type here...",
                    borderColor: Colors.transparent,
                    size: 70,
                    maxLine: 7,
                    isFilled: true,
                    fillColor: Colors.white,
                    textEditingController: controller.messageController,
                  ),
                ),
                Spacing.height(70),
                getButton(
                  title: "",
                  height: 50,
                  width: MySize.screenWidth,
                  widget: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(imagePath + "send_icon.svg",
                              height: MySize.getHeight(18)),
                          Spacing.width(15),
                          Text(
                            "SEND MESSAGE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MySize.getHeight(16),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
