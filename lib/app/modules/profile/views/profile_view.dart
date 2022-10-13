import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as p;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/api_constants.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../utilities/buttons.dart';
import '../../../utilities/text_field.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetWidget<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

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
              'Profile',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: (controller.hasData.value)
              ? (controller.userProfile != null)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Form(
                              key: controller.formKey.value,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: MySize.getHeight(22),
                                      vertical: MySize.getHeight(32),
                                    ),
                                    width: MySize.screenWidth,
                                    color: Color(0xffF7F7F7),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                getImageView(),
                                              ],
                                            ),
                                            Space.height(10),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: MySize.getHeight(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Spacing.height(20),
                                        Text(
                                          "NAME",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Spacing.height(8),
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 7),
                                                color: Colors.black
                                                    .withOpacity(0.08),
                                                blurRadius:
                                                    MySize.getHeight(13),
                                                spreadRadius:
                                                    MySize.getHeight(2),
                                              ),
                                            ],
                                          ),
                                          child: getTextField(
                                            hintText: "full name",
                                            borderColor: Colors.transparent,
                                            size: 70,
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(15),
                                              child: Image.asset(
                                                imagePath + "profile.png",
                                                height: MySize.getHeight(20),
                                                width: MySize.getWidth(20),
                                              ),
                                            ),
                                            isFilled: true,
                                            readOnly: true,
                                            fillColor: Colors.white,
                                            textEditingController:
                                                controller.nameController.value,
                                          ),
                                        ),
                                        Spacing.height(20),
                                        Text(
                                          "E-MAIL",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Spacing.height(8),
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 7),
                                                color: Colors.black
                                                    .withOpacity(0.08),
                                                blurRadius:
                                                    MySize.getHeight(13),
                                                spreadRadius:
                                                    MySize.getHeight(2),
                                              ),
                                            ],
                                          ),
                                          child: getTextField(
                                            hintText: "Your E-mail",
                                            borderColor: Colors.transparent,
                                            size: 70,
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(15),
                                              child: Image.asset(
                                                imagePath + "mail.png",
                                                height: MySize.getHeight(20),
                                                width: MySize.getWidth(20),
                                              ),
                                            ),
                                            isFilled: true,
                                            readOnly: true,
                                            fillColor: Colors.white,
                                            textEditingController: controller
                                                .emailController.value,
                                          ),
                                        ),
                                        Spacing.height(20),
                                        Text(
                                          "PHONE",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Spacing.height(8),
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 7),
                                                color: Colors.black
                                                    .withOpacity(0.08),
                                                blurRadius:
                                                    MySize.getHeight(13),
                                                spreadRadius:
                                                    MySize.getHeight(2),
                                              ),
                                            ],
                                          ),
                                          child: getTextField(
                                            hintText: "1 - 234 - 567 - 8901",
                                            borderColor: Colors.transparent,
                                            size: 70,
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(15),
                                              child: Image.asset(
                                                imagePath + "ic_call.png",
                                                height: MySize.getHeight(17),
                                                width: MySize.getWidth(22),
                                              ),
                                            ),
                                            isFilled: true,
                                            readOnly: true,
                                            fillColor: Colors.white,
                                            textInputType: TextInputType.number,
                                            textEditingController: controller
                                                .phoneController.value,
                                          ),
                                        ),
                                        Spacing.height(20),
                                        Text(
                                          "CURRENT PASSWORD",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Spacing.height(8),
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 7),
                                                color: Colors.black
                                                    .withOpacity(0.08),
                                                blurRadius:
                                                    MySize.getHeight(13),
                                                spreadRadius:
                                                    MySize.getHeight(2),
                                              ),
                                            ],
                                          ),
                                          child: getTextField(
                                            hintText: "Current password here",
                                            borderColor: Colors.transparent,
                                            size: 70,
                                            textVisible:
                                                !controller.isVisible1.value,
                                            prefixIcon: Icon(
                                              Icons.lock_outline,
                                              color: appTheme.primaryTheme,
                                            ),
                                            // labelText: "Password",
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  controller.isVisible1
                                                      .toggle();
                                                },
                                                child: Icon(
                                                  (controller.isVisible1.isTrue)
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.grey,
                                                )),
                                            isFilled: true,
                                            validation:
                                                (controller.profile == null)
                                                    ? (val) {
                                                        if (val!.isEmpty) {
                                                          return "Please Enter Current password";
                                                        }
                                                        return null;
                                                      }
                                                    : null,
                                            fillColor: Colors.white,
                                            textEditingController: controller
                                                .cPasswordController.value,
                                          ),
                                        ),
                                        Spacing.height(20),
                                        Text(
                                          "NEW PASSWORD",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Spacing.height(8),
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 7),
                                                color: Colors.black
                                                    .withOpacity(0.08),
                                                blurRadius:
                                                    MySize.getHeight(13),
                                                spreadRadius:
                                                    MySize.getHeight(2),
                                              ),
                                            ],
                                          ),
                                          child: getTextField(
                                            hintText: "New password here",
                                            borderColor: Colors.transparent,
                                            size: 70,

                                            isFilled: true,

                                            validation:
                                                (controller.profile == null)
                                                    ? (val) {
                                                        if (val!.isEmpty) {
                                                          return "Please Enter New password";
                                                        }
                                                        return null;
                                                      }
                                                    : null,
                                            textVisible:
                                                !controller.isVisible2.value,
                                            prefixIcon: Icon(
                                              Icons.lock_outline,
                                              color: appTheme.primaryTheme,
                                            ),
                                            //labelText: "Password",
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  controller.isVisible2
                                                      .toggle();
                                                },
                                                child: Icon(
                                                  (controller.isVisible2.isTrue)
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.grey,
                                                )),
                                            fillColor: Colors.white,
                                            textEditingController: controller
                                                .nPasswordController.value,
                                          ),
                                        ),
                                        Spacing.height(20),
                                        Text(
                                          "CONFIRM PASSWORD",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Spacing.height(8),
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 7),
                                                color: Colors.black
                                                    .withOpacity(0.08),
                                                blurRadius:
                                                    MySize.getHeight(13),
                                                spreadRadius:
                                                    MySize.getHeight(2),
                                              ),
                                            ],
                                          ),
                                          child: getTextField(
                                            hintText: "Confirm password here",
                                            borderColor: Colors.transparent,
                                            size: 70,
                                            textVisible:
                                                !controller.isVisible3.value,
                                            prefixIcon: Icon(
                                              Icons.lock_outline,
                                              color: appTheme.primaryTheme,
                                            ),
                                            // labelText: "Password",
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  controller.isVisible3
                                                      .toggle();
                                                },
                                                child: Icon(
                                                  (controller.isVisible3.isTrue)
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.grey,
                                                )),
                                            isFilled: true,
                                            validation:
                                                (controller.profile == null)
                                                    ? (val) {
                                                        if (val!.isEmpty) {
                                                          return "Please Enter Confirm password";
                                                        }
                                                        if (val !=
                                                            controller
                                                                .nPasswordController
                                                                .value
                                                                .text)
                                                          return 'Not match both password';
                                                        return null;
                                                      }
                                                    : null,
                                            fillColor: Colors.white,
                                            textEditingController: controller
                                                .confirmPasswordController
                                                .value,
                                          ),
                                        ),
                                        Spacing.height(20),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MySize.getWidth(20),
                              vertical: MySize.getWidth(20)),
                          child: InkWell(
                            onTap: () {
                              if (controller.formKey.value.currentState!
                                  .validate()) {
                                controller.updateProfileData(
                                    context: Get.context!);
                              }
                            },
                            child: getButton(
                              title: "SAVE",
                              height: 50,
                              width: MySize.screenWidth,
                              // widget: Center(
                              //   child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         SvgPicture.asset(imagePath + "send_icon.svg",
                              //             height: MySize.getHeight(18)),
                              //         Spacing.width(15),
                              //         Text(
                              //           "SEND MESSAGE",
                              //           style: TextStyle(
                              //             color: Colors.white,
                              //             fontSize: MySize.getHeight(16),
                              //             fontWeight: FontWeight.w500,
                              //           ),
                              //         )
                              //       ]),
                              // ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text("No Data Found"),
                    )
              : Center(
                  child: CircularProgressIndicator(
                    color: appTheme.primaryTheme,
                  ),
                ),
        ),
      );
    });
  }

  Widget getImageView() {
    return InkWell(
      onTap: () async {
        FocusScope.of(Get.context!).unfocus();
        Get.dialog(Dialog(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    PickedFile? image =
                        await _picker.getImage(source: ImageSource.camera);
                    // Get.back();
                    if (image != null) {
                      // controller.isValueChanged.value = true;
                      // Get.back();

                      controller.profile = File(image.path).obs;
                      controller.imgFileName = p.basename(image.path);
                      controller.profile!.refresh();
                      controller.update();
                      controller.count.value++;

                      controller.profileImg.value = true;
                      controller.isImageSelected.value = true;
                      Get.back();
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          height: 60,
                          child: Icon(
                            Icons.camera,
                            color: appTheme.primaryTheme,
                            size: 60,
                          )),
                      Space.height(10),
                      Text(
                        "Camera",
                        style: TextStyle(
                          color: appTheme.primaryTheme,
                          fontWeight: FontWeight.bold,
                          fontSize: MySize.getHeight(18),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    PickedFile? image =
                        await _picker.getImage(source: ImageSource.gallery);
                    // Get.back();
                    if (image != null) {
                      //  Get.back();

                      controller.profile = File(image.path).obs;
                      controller.imgFileName = p.basename(image.path);
                      controller.profile!.refresh();
                      controller.refresh();
                      controller.count.value++;
                      controller.profileImg.refresh();
                      controller.profileImg.value = true;
                      controller.isImageSelected.value = true;
                      Get.back();
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 60,
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          color: appTheme.primaryTheme,

                          //color: AppColors.kOrange,
                          size: 60,
                        ),
                      ),
                      Space.height(10),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          color: appTheme.primaryTheme,
                          fontWeight: FontWeight.bold,
                          fontSize: MySize.getHeight(18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
        // final ImagePicker _picker = ImagePicker();
        // PickedFile? image =
        //     await _picker.getImage(source: ImageSource.gallery);
        // if (image != null) {
        //   //  Get.back();
        //
        //   controller.profile = File(image.path).obs;
        //   controller.imgFileName = p.basename(image.path);
        //   controller.profile!.refresh();
        //   controller.update();
        //   controller.count.value++;
        //
        //   controller.profileImg.value = true;
        //   controller.isImageSelected.value = true;
        //   if (controller.isFromEdit.value) {
        //     controller.callApiForUploadImageUser(context: Get.context!);
        //   }
        // }
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              MySize.getHeight(200),
            ),
            child: (controller.profile != null || controller.profileImg.isTrue)
                ? Image.file(controller.profile!.value!,
                    width: MySize.getHeight(140),
                    height: MySize.getHeight(140),
                    fit: BoxFit.cover)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: getImageByLink(
                      url:
                          imageBaseUrl + controller.userProfile!.pic.toString(),
                      boxFit: BoxFit.cover,
                      height: 140,
                      width: 140,
                    ),
                  ),
          ),
          Positioned(
            right: MySize.getHeight(10),
            top: MySize.getHeight(10),
            child: SvgPicture.asset(imagePath + "edit_icon.svg"),
          ),
        ],
      ),
    );
  }
}
