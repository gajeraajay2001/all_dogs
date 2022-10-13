import 'package:all_dogs/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class SignupScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isVisible1 = false.obs;
  RxBool isVisible2 = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  callApiForSignUp({
    required BuildContext context,
  }) {
    FocusScope.of(context).unfocus();
    getIt.get<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["name"] = nameController.value.text;
    dict["email"] = emailController.value.text;
    dict["password"] = passwordController.value.text;
    dict["mobile"] = mobileNumberController.value.text;
    FormData formData = new FormData.fromMap(dict);

    // print(token);

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.signup,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);
        if (response["responseCode"] == 200) {
          // box.re
          getIt.get<CustomDialogs>().getDialog(
              title: "Registration Success",
              desc:
                  "An email has been sent to the registered email. Please verify that email to continue.",
              onTap: () {
                Get.offAllNamed(Routes.LOGIN_SCREEN);
              });
        } else {
          getIt
              .get<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (status, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);

        getIt.get<CustomDialogs>().getDialog(title: "Failed", desc: message);
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
}
