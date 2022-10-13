import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  callApiForResetPassword({
    required BuildContext context,
  }) {
    FocusScope.of(context).unfocus();
    getIt.get<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["email"] = emailController.value.text;
    // dict["password"] = passwordController.value.text;
    FormData formData = new FormData.fromMap(dict);

    // print(token);

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.resetPassword,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);
        if (response["responseCode"] == 200) {
          // box.re
          getIt.get<CustomDialogs>().getDialog(
              title: "Reset Instructions Sent",
              desc:
                  "An email has been sent to the registered email for resetting your password.",
              onTap: () {
                Get.close(2);
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
  void onClose() {
    super.onClose();
  }
}
