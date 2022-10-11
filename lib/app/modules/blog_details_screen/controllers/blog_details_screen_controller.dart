import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/models/blog_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class BlogDetailsScreenController extends GetxController {
  RxBool hasData = false.obs;
  String url = "";
  String postId = "";
  @override
  void onInit() {
    if (!isNullEmptyOrFalse(Get.arguments[ArgumentConstant.postId])) {
      postId = Get.arguments[ArgumentConstant.postId];
      getBlogDetailsData(context: Get.context!, id: postId);
    }
    super.onInit();
  }

  getBlogDetailsData(
      {required BuildContext context, required String id}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.getBlogDetailsApi + id,
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasData.value = true;
        if (response["responseCode"] == 200) {
          BlogDetailsModel res = BlogDetailsModel.fromJson(response);
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.blog)) {
              if (!isNullEmptyOrFalse(res.data!.blog!.filename)) {
                url =
                    "https://alldogs.in/blogs/${res.data!.blog!.filename.toString()}";
                print("URL :=== $url");
              }
            }
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
