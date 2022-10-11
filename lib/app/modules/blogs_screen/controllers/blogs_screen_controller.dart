import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/models/blog_list_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class BlogsScreenController extends GetxController {
  RefreshController refreshController = RefreshController();
  RxList<Blogs> blogList = RxList<Blogs>([]);
  RxBool loadCompleted = false.obs;
  RxBool hasData = false.obs;
  RxInt page = 1.obs;
  @override
  void onInit() {
    getBlogLists(context: Get.context!, isForLoading: false);
    super.onInit();
  }

  getBlogLists(
      {required BuildContext context, bool isForLoading = false}) async {
    if (!isForLoading) {
      hasData.value = false;
    }
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.blogsListApi + "?page=$page&limit=10",
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasData.value = true;
        if (response["responseCode"] == 200) {
          BlogListDataModel res = BlogListDataModel.fromJson(response);
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.blogs)) {
              res.data!.blogs!.forEach((element) {
                blogList.add(element);
              });
              refreshController.loadComplete();
            } else {
              if (isForLoading) {
                loadCompleted.value = true;
                refreshController.loadComplete();
              }
            }
          }
        } else {
          getIt
              .get<CustomDialogs>()
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
