import 'package:all_dogs/app/models/BreedersListModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../constants/sizeConstant.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class BreedersScreenController extends GetxController {
  RxList<Breeders> breederList = RxList<Breeders>([]);
  RxBool hasData = false.obs;
  RxInt page = 1.obs;
  RxInt pageLimit = 10.obs;
  RxBool allDataLoaded = false.obs;
  late ScrollController controller;

  @override
  void onInit() {
    getBreederLstData(context: Get.context!);
    controller = ScrollController()..addListener(_loadMore);
    super.onInit();
  }

  void _loadMore() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      if (allDataLoaded.isFalse) {
        page.value++;
        getBreederLstData(context: Get.context!, isMoreDataLoad: true);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  getBreederLstData(
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
      breederList.clear();
    }
    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.breederListApi +
          "?page=${page.value}&limit=${pageLimit.value}${!isNullEmptyOrFalse(search) ? "&search=$search" : ""}",
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        // hasData.value = true;
        if (!isMoreDataLoad) {
          hasData.value = true;
        }
        BreedersListModel res = BreedersListModel.fromJson(response);
        if (!isNullEmptyOrFalse(res.data)) {
          if (page.value == res.data!.totalPages) {
            allDataLoaded.value = true;
          }
          if (!isNullEmptyOrFalse(res.data!.breeders)) {
            res.data!.breeders!.forEach((element) {
              breederList.add(element);
            });
          }
        }
      },
      failureCallback: (response, message) {
        if (!isMoreDataLoad) {
          hasData.value = true;
        }
        getIt<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print(" error");
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
