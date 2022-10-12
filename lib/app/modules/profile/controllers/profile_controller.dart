import 'dart:io';

import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../models/UserProfileModel.dart';
import '../../../utilities/progress_dialog_utils.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> cPasswordController = TextEditingController().obs;
  Rx<TextEditingController> nPasswordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  Rx<File?>? profile;
  UserProfile? userProfile;

  RxBool isVisible1 = false.obs;
  RxBool isVisible2 = false.obs;
  RxBool isVisible3 = false.obs;
  Rx<bool> profileImg = false.obs;
  Rx<bool> isImageSelected = false.obs;
  String? imgFileName;
  RxBool hasData = false.obs;
  @override
  void onInit() {
    super.onInit();
    getProfileDetailsData(context: Get.context!);
  }

  getProfileDetailsData({required BuildContext context}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.userProfileApi,
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasData.value = true;
        if (response["responseCode"] == 200) {
          UserProfileModel res = UserProfileModel.fromJson(response);
          if (res.data != null) {
            userProfile = res.data;
            nameController.value.text = userProfile!.name ?? "";
            emailController.value.text = userProfile!.email ?? "";
            phoneController.value.text = userProfile!.mobile ?? "";
          }
        } else {
          getIt<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (response, message) {
        hasData.value = true;
        getIt<CustomDialogs>()
            .getDialog(title: "Failed", desc: "Something went wrong.");
        print(" error");
      },
    );
  }

  updateProfileData({required BuildContext context}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};
    if (profile != null) {
      dict["pic"] = await MultipartFile.fromFile(profile!.value!.path,
          filename: imgFileName);
    }
    if (!isNullEmptyOrFalse(cPasswordController.value.text)) {
      dict["current_password"] = cPasswordController.value.text;
      dict["new_password"] = confirmPasswordController.value.text;
    }
    FormData formData = new FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.userProfileApi,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        hasData.value = true;
        if (response["responseCode"] == 200) {
          getIt<CustomDialogs>().getDialog(
              title: "Success",
              desc: "Profile Updated Successfully.",
              onTap: () {
                if (!isNullEmptyOrFalse(cPasswordController.value.text)) {
                  getLogOut();
                } else {
                  Get.offAllNamed(Routes.HOME_SCREEN);
                }
              });
        } else {
          getIt<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (response, message) {
        hasData.value = true;
        getIt<CustomDialogs>()
            .getDialog(title: "Failed", desc: "Something went wrong.");
        print(" error");
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
