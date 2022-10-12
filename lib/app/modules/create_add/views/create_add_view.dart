import 'dart:io';

import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../constants/api_constants.dart';
import '../../../constants/sizeConstant.dart';
import '../../../utilities/buttons.dart';
import '../../../utilities/text_field.dart';
import '../controllers/create_add_controller.dart';

class CreateAddView extends GetWidget<CreateAddController> {
  const CreateAddView({Key? key}) : super(key: key);

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
              'Create an Ad',
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
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: MySize.getWidth(20)),
                          child: Form(
                            key: controller.formKey.value,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacing.height(5),
                                Text(
                                  "Ad Listing",
                                  style: TextStyle(
                                      fontSize: MySize.getHeight(20),
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacing.height(8),
                                Text(
                                  "Submit your ad with this form",
                                  style: TextStyle(
                                      fontSize: MySize.getHeight(12),
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacing.height(20),
                                Text(
                                  "TITLE *",
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
                                    hintText: "Enter title here",
                                    borderColor: Colors.transparent,
                                    size: 70,
                                    isFilled: true,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Please Enter title";
                                      }
                                      return null;
                                    },
                                    fillColor: Colors.white,
                                    textEditingController:
                                        controller.titleController.value,
                                  ),
                                ),
                                Spacing.height(30),
                                Text(
                                  "BODY *",
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
                                    hintText: "",
                                    borderColor: Colors.transparent,
                                    size: 70,
                                    maxLine: 5,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter body text";
                                      }
                                      return null;
                                    },
                                    isFilled: true,
                                    fillColor: Colors.white,
                                    textEditingController:
                                        controller.bodyController.value,
                                  ),
                                ),
                                Spacing.height(30),
                                Text(
                                  "BREED *",
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
                                    hintText: "Enter breed here",
                                    borderColor: Colors.transparent,
                                    size: 70,
                                    isFilled: true,
                                    fillColor: Colors.white,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter breed name";
                                      }
                                      return null;
                                    },
                                    // textInputType: TextInputType.number,
                                    textEditingController:
                                        controller.breedController.value,
                                  ),
                                ),
                                Spacing.height(30),
                                Text(
                                  "DATE OF BIRTH *",
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
                                    hintText: "DD-mm-yyyy",
                                    borderColor: Colors.transparent,
                                    size: 70,
                                    isFilled: true,
                                    fillColor: Colors.white,
                                    readOnly: true,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter date of birth";
                                      }
                                      return null;
                                    },
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Image.asset(
                                        imagePath + "ic_cal.png",
                                        height: MySize.getHeight(20),
                                        width: MySize.getWidth(20),
                                      ),
                                    ),
                                    onTap: () {
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1800, 1),
                                          lastDate: DateTime(3000, 12),
                                          builder: (context, picker) {
                                            return Theme(
                                              data: ThemeData.dark().copyWith(
                                                colorScheme: ColorScheme.dark(
                                                  primary: Colors.white,

                                                  onPrimary: Colors.black,
                                                  surface:
                                                      appTheme.primaryTheme,
                                                  // onSurface:
                                                  //     Colors.yellow,
                                                ),
                                                // dialogBackgroundColor: Colors.white,
                                              ),
                                              child: picker!,
                                            );
                                          }).then((selectedDate) {
                                        if (selectedDate != null) {
                                          controller.dateController.value.text =
                                              DateFormat("dd-MM-yyyy")
                                                  .format(selectedDate);
                                          controller.dob1Controller.value.text =
                                              DateFormat("yyy-MM-dd")
                                                  .format(selectedDate);
                                        }
                                      });
                                    },
                                    textInputType: TextInputType.number,
                                    textEditingController:
                                        controller.dateController.value,
                                  ),
                                ),
                                Spacing.height(30),
                                Text(
                                  "LOCATION *",
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
                                    hintText: "Enter location here",
                                    borderColor: Colors.transparent,
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Image.asset(
                                        imagePath + "ic_location.png",
                                        height: MySize.getHeight(20),
                                        width: MySize.getWidth(20),
                                      ),
                                    ),
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter location";
                                      }
                                      return null;
                                    },
                                    size: 70,
                                    isFilled: true,
                                    fillColor: Colors.white,
                                    // textInputType: TextInputType.number,
                                    textEditingController:
                                        controller.locationController.value,
                                  ),
                                ),
                                Spacing.height(30),
                                Row(
                                  children: [
                                    Container(
                                      height: MySize.getHeight(20),
                                      width: MySize.getHeight(20),
                                      child: Checkbox(
                                        activeColor: appTheme.primaryTheme,
                                        value: controller.hasChecked.value,
                                        onChanged: (val) {
                                          controller.hasChecked.value = val!;
                                        },
                                      ),
                                    ),
                                    Space.width(8),
                                    Text(
                                      "Is available?",
                                      style: TextStyle(
                                          fontSize: MySize.getHeight(12),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Spacing.height(30),
                                Text(
                                  "YOUTUBE VIDEO URL",
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
                                    hintText: "Enter youtube video url here",
                                    borderColor: Colors.transparent,
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Image.asset(
                                        imagePath + "ic_file.png",
                                        height: MySize.getHeight(20),
                                        width: MySize.getWidth(20),
                                      ),
                                    ),
                                    size: 70,
                                    isFilled: true,
                                    validation: (val) {
                                      if (val!.isNotEmpty) {
                                        if (!val.contains(
                                            'https://www.youtube.com/embed/')) {
                                          return 'Invalid link. Link must contain "https://www.youtube.com/embed/"';
                                        }
                                        return null;
                                      }
                                      return null;
                                    },
                                    fillColor: Colors.white,
                                    // textInputType: TextInputType.number,
                                    textEditingController:
                                        controller.youtubeController.value,
                                  ),
                                ),
                                Spacing.height(30),
                                getImageView(
                                    context: context,
                                    index: "1",
                                    c1: controller.text1Controller,
                                    c2: controller.pic1Controller,
                                    isValidationRequired: true,
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      PickedFile? image =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.image1 =
                                            File(image.path).obs;
                                        controller.imgFileName1 =
                                            p.basename(image.path);
                                        controller.pic1Controller.value.text =
                                            p.basename(image.path);
                                      }
                                    }),
                                getImageView(
                                    context: context,
                                    index: "2",
                                    c1: controller.text2Controller,
                                    c2: controller.pic2Controller,
                                    isValidationRequired: false,
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      PickedFile? image =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.image2 =
                                            File(image.path).obs;
                                        controller.imgFileName2 =
                                            p.basename(image.path);
                                        controller.pic2Controller.value.text =
                                            p.basename(image.path);
                                      }
                                    }),
                                getImageView(
                                    context: context,
                                    index: "3",
                                    c1: controller.text3Controller,
                                    c2: controller.pic3Controller,
                                    isValidationRequired: false,
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      PickedFile? image =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.image3 =
                                            File(image.path).obs;
                                        controller.imgFileName3 =
                                            p.basename(image.path);
                                        controller.pic3Controller.value.text =
                                            p.basename(image.path);
                                      }
                                    }),
                                getImageView(
                                    context: context,
                                    index: "4",
                                    c1: controller.text4Controller,
                                    c2: controller.pic4Controller,
                                    isValidationRequired: false,
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      PickedFile? image =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.image4 =
                                            File(image.path).obs;
                                        controller.imgFileName4 =
                                            p.basename(image.path);
                                        controller.pic4Controller.value.text =
                                            p.basename(image.path);
                                      }
                                    }),
                                getImageView(
                                    context: context,
                                    index: "5",
                                    c1: controller.text5Controller,
                                    c2: controller.pic5Controller,
                                    isValidationRequired: false,
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      PickedFile? image =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.image5 =
                                            File(image.path).obs;
                                        controller.imgFileName5 =
                                            p.basename(image.path);
                                        controller.pic5Controller.value.text =
                                            p.basename(image.path);
                                      }
                                    }),
                                getImageView(
                                    context: context,
                                    index: "6",
                                    c1: controller.text6Controller,
                                    c2: controller.pic6Controller,
                                    isValidationRequired: false,
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      PickedFile? image =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.image6 =
                                            File(image.path).obs;
                                        controller.imgFileName6 =
                                            p.basename(image.path);
                                        controller.pic6Controller.value.text =
                                            p.basename(image.path);
                                      }
                                    }),
                                getImageView(
                                    context: context,
                                    index: "7",
                                    c1: controller.text7Controller,
                                    c2: controller.pic7Controller,
                                    isValidationRequired: false,
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      PickedFile? image =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.image7 =
                                            File(image.path).obs;
                                        controller.imgFileName7 =
                                            p.basename(image.path);
                                        controller.pic7Controller.value.text =
                                            p.basename(image.path);
                                      }
                                    }),
                                getImageView(
                                    context: context,
                                    index: "8",
                                    c1: controller.text8Controller,
                                    c2: controller.pic8Controller,
                                    isValidationRequired: false,
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      PickedFile? image =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.image8 =
                                            File(image.path).obs;
                                        controller.imgFileName8 =
                                            p.basename(image.path);
                                        controller.pic8Controller.value.text =
                                            p.basename(image.path);
                                      }
                                    }),
                                getImageView(
                                    context: context,
                                    index: "9",
                                    c1: controller.text9Controller,
                                    c2: controller.pic9Controller,
                                    isValidationRequired: false,
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      PickedFile? image =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.image9 =
                                            File(image.path).obs;
                                        controller.imgFileName9 =
                                            p.basename(image.path);
                                        controller.pic9Controller.value.text =
                                            p.basename(image.path);
                                      }
                                    }),
                                getImageView(
                                    context: context,
                                    index: "10",
                                    c1: controller.text10Controller,
                                    c2: controller.pic10Controller,
                                    isValidationRequired: false,
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      PickedFile? image =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.image10 =
                                            File(image.path).obs;
                                        controller.imgFileName10 =
                                            p.basename(image.path);
                                        controller.pic10Controller.value.text =
                                            p.basename(image.path);
                                      }
                                    }),
                              ],
                            ),
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
                            if (controller.isForEdit) {
                              controller.callApiForEditPost(
                                  context: Get.context!);
                            } else {
                              controller.callApiForCreatePost(
                                  context: Get.context!);
                            }
                          }
                        },
                        child: getButton(
                          title: "SUBMIT",
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
                ),
        ),
      );
    });
  }

  getImageView({
    required BuildContext context,
    required String index,
    required Rx<TextEditingController> c1,
    required Rx<TextEditingController> c2,
    required bool isValidationRequired,
    required VoidCallback onTap,
  }) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.height(30),
          Text(
            "PICTURE TEXT ${index} ${(index == "1") ? "*" : ""}",
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
              hintText: "Enter picture description here",
              borderColor: Colors.transparent,
              // suffixIcon: getSuffixImageIcon(),
              size: 70,
              validation: (isValidationRequired)
                  ? (val) {
                      if (val!.isEmpty) {
                        return "Please add the picture description";
                      }
                      return null;
                    }
                  : null,
              isFilled: true,
              fillColor: Colors.white,
              // textInputType: TextInputType.number,
              textEditingController: c1.value,
            ),
          ),
          Spacing.height(30),
          Text(
            "PIC $index ${(index == "1") ? "*" : ""}",
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
              hintText: "No file chosen",
              borderColor: Colors.transparent,
              suffixIcon:
                  (controller.isForEdit && !isNullEmptyOrFalse(c2.value.text))
                      ? null
                      : getSuffixImageIcon(),
              size: 70,
              isFilled: true,
              fillColor: Colors.white,
              readOnly: true,
              validation: (isValidationRequired)
                  ? (val) {
                      if (val!.isEmpty) {
                        return "Please add the picture";
                      }
                      return null;
                    }
                  : null,
              onTap: onTap,
              textInputType: TextInputType.number,
              textEditingController: c2.value,
            ),
          ),
          Spacing.height(10),
          if (controller.isForEdit && !isNullEmptyOrFalse(c2.value.text))
            InkWell(
              onTap: () {
                controller.callApiForDeletePostPic(
                    context: context,
                    textEditingControllerPic: c2,
                    textEditingControllertext: c1,
                    key: "DeletePic$index");
              },
              child: Container(
                height: MySize.getHeight(30),
                width: MySize.getWidth(90),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: appTheme.primaryTheme,
                        width: MySize.getHeight(1.5)),
                    borderRadius: BorderRadius.circular(MySize.getHeight(5))),
                child: Text(
                  "REMOVE",
                  style: TextStyle(
                      color: appTheme.primaryTheme,
                      fontSize: MySize.getHeight(13)),
                ),
              ),
            ),
          Spacing.height(10),
        ],
      );
    });
  }

  getSuffixImageIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MySize.getHeight(5),
        horizontal: MySize.getHeight(10),
      ),
      child: Container(
        width: MySize.getWidth(82),
        height: MySize.getWidth(24),
        decoration: BoxDecoration(
          color: appTheme.primaryTheme,
          borderRadius: BorderRadius.circular(
            MySize.getHeight(4),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose File",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: MySize.getHeight(10),
              ),
            ),
            Space.width(6),
            Image.asset(
              imagePath + "ic_file.png",
              height: MySize.getHeight(10),
              color: Colors.white,
              fit: BoxFit.fill,
              width: MySize.getWidth(10),
            ),
          ],
        ),
      ),
    );
  }
}
