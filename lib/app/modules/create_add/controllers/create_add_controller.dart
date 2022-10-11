import 'dart:io';

import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class CreateAddController extends GetxController {
  //TODO: Implement CreateAddController

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;
  Rx<TextEditingController> breedController = TextEditingController().obs;
  Rx<TextEditingController> dob1Controller = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> youtubeController = TextEditingController().obs;
  Rx<TextEditingController> text1Controller = TextEditingController().obs;
  Rx<TextEditingController> pic1Controller = TextEditingController().obs;
  Rx<TextEditingController> text2Controller = TextEditingController().obs;
  Rx<TextEditingController> pic2Controller = TextEditingController().obs;
  Rx<TextEditingController> text3Controller = TextEditingController().obs;
  Rx<TextEditingController> pic3Controller = TextEditingController().obs;
  Rx<TextEditingController> text4Controller = TextEditingController().obs;
  Rx<TextEditingController> pic4Controller = TextEditingController().obs;
  Rx<TextEditingController> text5Controller = TextEditingController().obs;
  Rx<TextEditingController> pic5Controller = TextEditingController().obs;
  Rx<TextEditingController> text6Controller = TextEditingController().obs;
  Rx<TextEditingController> pic6Controller = TextEditingController().obs;
  Rx<TextEditingController> text7Controller = TextEditingController().obs;
  Rx<TextEditingController> pic7Controller = TextEditingController().obs;
  Rx<TextEditingController> text8Controller = TextEditingController().obs;
  Rx<TextEditingController> pic8Controller = TextEditingController().obs;
  Rx<TextEditingController> text9Controller = TextEditingController().obs;
  Rx<TextEditingController> pic9Controller = TextEditingController().obs;
  Rx<TextEditingController> text10Controller = TextEditingController().obs;
  Rx<TextEditingController> pic10Controller = TextEditingController().obs;

  Rx<File?>? image1;
  String? imgFileName1;
  Rx<File?>? image2;
  String? imgFileName2;
  Rx<File?>? image3;
  String? imgFileName3;
  Rx<File?>? image4;
  String? imgFileName4;
  Rx<File?>? image5;
  String? imgFileName5;
  Rx<File?>? image6;
  String? imgFileName6;
  Rx<File?>? image7;
  String? imgFileName7;
  Rx<File?>? image8;
  String? imgFileName8;
  Rx<File?>? image9;
  String? imgFileName9;
  Rx<File?>? image10;
  String? imgFileName10;

  RxBool hasChecked = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  callApiForCreatePost({
    required BuildContext context,
  }) async {
    FocusScope.of(context).unfocus();
    getIt.get<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["title"] = titleController.value.text;
    dict["body"] = bodyController.value.text;
    dict["breed"] = breedController.value.text;
    dict["dob"] = dob1Controller.value.text;
    dict["location"] = locationController.value.text;
    dict["video"] = youtubeController.value.text;
    dict["available"] = hasChecked.value;
    if (image1 != null) {
      dict["pic1"] = await MultipartFile.fromFile(image1!.value!.path,
          filename: imgFileName1);
    }
    if (!isNullEmptyOrFalse(text1Controller.value.text)) {
      dict["pictxt1"] = text1Controller.value.text;
    }
    if (image2 != null) {
      dict["pic2"] = await MultipartFile.fromFile(image2!.value!.path,
          filename: imgFileName2);
    }
    if (!isNullEmptyOrFalse(text2Controller.value.text)) {
      dict["pictxt2"] = text2Controller.value.text;
    }
    if (image3 != null) {
      dict["pic3"] = await MultipartFile.fromFile(image3!.value!.path,
          filename: imgFileName3);
    }
    if (!isNullEmptyOrFalse(text3Controller.value.text)) {
      dict["pictxt3"] = text3Controller.value.text;
    }
    if (image4 != null) {
      dict["pic4"] = await MultipartFile.fromFile(image4!.value!.path,
          filename: imgFileName4);
    }
    if (!isNullEmptyOrFalse(text4Controller.value.text)) {
      dict["pictxt4"] = text4Controller.value.text;
    }
    if (image5 != null) {
      dict["pic5"] = await MultipartFile.fromFile(image5!.value!.path,
          filename: imgFileName5);
    }
    if (!isNullEmptyOrFalse(text5Controller.value.text)) {
      dict["pictxt5"] = text5Controller.value.text;
    }
    if (image6 != null) {
      dict["pic6"] = await MultipartFile.fromFile(image6!.value!.path,
          filename: imgFileName6);
    }
    if (!isNullEmptyOrFalse(text6Controller.value.text)) {
      dict["pictxt6"] = text6Controller.value.text;
    }
    if (image7 != null) {
      dict["pic7"] = await MultipartFile.fromFile(image7!.value!.path,
          filename: imgFileName7);
    }
    if (!isNullEmptyOrFalse(text7Controller.value.text)) {
      dict["pictxt7"] = text7Controller.value.text;
    }
    if (image8 != null) {
      dict["pic8"] = await MultipartFile.fromFile(image8!.value!.path,
          filename: imgFileName8);
    }
    if (!isNullEmptyOrFalse(text8Controller.value.text)) {
      dict["pictxt8"] = text8Controller.value.text;
    }
    if (image9 != null) {
      dict["pic9"] = await MultipartFile.fromFile(image9!.value!.path,
          filename: imgFileName9);
    }
    if (!isNullEmptyOrFalse(text9Controller.value.text)) {
      dict["pictxt9"] = text9Controller.value.text;
    }
    if (image10 != null) {
      dict["pic10"] = await MultipartFile.fromFile(image10!.value!.path,
          filename: imgFileName10);
    }
    if (!isNullEmptyOrFalse(text10Controller.value.text)) {
      dict["pictxt10"] = text10Controller.value.text;
    }

    FormData formData = new FormData.fromMap(dict);

    // print(token);

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.postCreateApi,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);

        if (response["responseCode"] == 200) {
          Get.offAllNamed(Routes.HOME_SCREEN);
        } else {
          getIt
              .get<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (status, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);

        getIt
            .get<CustomDialogs>()
            .getDialog(title: "Failed", desc: status["message"]);
        print(" error");
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
