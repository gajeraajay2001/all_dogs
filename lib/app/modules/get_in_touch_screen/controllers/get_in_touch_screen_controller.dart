import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class GetInTouchScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  callContactUsApi({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    getIt<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};

    dict["name"] = nameController.value.text;
    dict["email"] = mailController.value.text;
    dict["message"] = messageController.value.text;
    FormData formData = FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.contactUsApi,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        getIt<CustomDialogs>().hideCircularDialog(context);

        if (response["responseCode"] == 200) {
          getIt<CustomDialogs>().getDialog(
              title: "Done",
              desc: response["message"],
              onTap: () {
                Get.back();
                Get.back();
              });
        } else {
          getIt<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (response, message) {
        getIt<CustomDialogs>().hideCircularDialog(context);

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
