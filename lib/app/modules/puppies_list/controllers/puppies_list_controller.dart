import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../constants/sizeConstant.dart';
import '../../../data/NetworkClient.dart';
import '../../../models/home_screen_data_model.dart';
import '../../../utilities/progress_dialog_utils.dart';

class PuppiesListController extends GetxController {
  RxList<Posts> puppiesList = RxList<Posts>([]);
  RxBool hasData = false.obs;
  RxInt page = 1.obs;
  RxInt pageLimit = 10.obs;
  RxBool allDataLoaded = false.obs;
  late ScrollController controller;

  @override
  void onInit() {
    getPuppiesList(context: Get.context!);
    controller = ScrollController()..addListener(_loadMore);
    super.onInit();
  }

  void _loadMore() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      if (allDataLoaded.isFalse) {
        page.value++;
        getPuppiesList(context: Get.context!, isMoreDataLoad: true);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  getPuppiesList(
      {required BuildContext context,
      bool isFromSearch = false,
      bool isMoreDataLoad = false,
      String search = ""}) async {
    if (!isMoreDataLoad) {
      hasData.value = false;
    }
    Map<String, dynamic> dict = {};
    if (isFromSearch) {
      page.value = 1;
      puppiesList.clear();
    }
    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.puppiesPostListApi +
          "?page=${page.value}&limit=${pageLimit.value}${!isNullEmptyOrFalse(search) ? "&search=$search" : ""}",
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        // hasData.value = true;
        if (!isMoreDataLoad) {
          hasData.value = true;
        }
        HomeScreenDataModel res = HomeScreenDataModel.fromJson(response);
        if (!isNullEmptyOrFalse(res.data)) {
          if (page.value == res.data!.totalPages) {
            allDataLoaded.value = true;
          }
          if (!isNullEmptyOrFalse(res.data!.posts)) {
            res.data!.posts!.forEach((element) {
              puppiesList.add(element);
            });
          }
        }
      },
      failureCallback: (response, message) {
        if (!isMoreDataLoad) {
          hasData.value = true;
        }
        getIt<CustomDialogs>()
            .getDialog(title: "Failed", desc: "Something went wrong.");
        print(" error");
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
