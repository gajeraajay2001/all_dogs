import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class AboutUsScreenController extends GetxController {
  RxBool hasData = false.obs;
  RxString data = "".obs;
  @override
  void onInit() {
    callAboutUsApi(context: Get.context!);
    super.onInit();
  }

  callAboutUsApi({required BuildContext context}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.aboutUsApi,
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasData.value = true;
        if (!isNullEmptyOrFalse(response)) {
          data.value = response.toString();
        }
      },
      failureCallback: (response, message) {
        hasData.value = true;
        getIt<CustomDialogs>().getDialog(title: "Failed", desc: message);
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
