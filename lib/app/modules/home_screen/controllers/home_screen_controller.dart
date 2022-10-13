import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/models/home_screen_data_model.dart';
import 'package:all_dogs/app/models/profile_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class HomeScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxList<Posts> postList = RxList<Posts>([]);
  RxList<Blogs> blogList = RxList<Blogs>([]);
  RxBool hasData = false.obs;
  @override
  void onInit() {
    if (!isNullEmptyOrFalse(box.read(ArgumentConstant.token))) {
      getUserProfileData(context: Get.context!);
    } else {
      getHomeScreenData(context: Get.context!);
    }

    super.onInit();
  }

  getHomeScreenData({required BuildContext context}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.homeDataApi,
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasData.value = true;
        HomeScreenDataModel res = HomeScreenDataModel.fromJson(response);
        if (!isNullEmptyOrFalse(res.data)) {
          if (!isNullEmptyOrFalse(res.data!.posts)) {
            res.data!.posts!.forEach((element) {
              postList.add(element);
            });
          }
          if (!isNullEmptyOrFalse(res.data!.blogs)) {
            res.data!.blogs!.forEach((element) {
              blogList.add(element);
            });
          }
        }
      },
      failureCallback: (response, message) {
        hasData.value = true;
        getIt<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print(" error");
      },
    );
  }

  getUserProfileData({required BuildContext context}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.getUserProfile,
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasData.value = true;
        if (response["responseCode"] == 200) {
          getHomeScreenData(context: Get.context!);
          ProfileDataModel res = ProfileDataModel.fromJson(response);
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.id)) {
              box.write(ArgumentConstant.userId, res.data!.id.toString());
            }
            if (!isNullEmptyOrFalse(res.data!.name)) {
              box.write(ArgumentConstant.name, res.data!.name.toString());
            }
            if (!isNullEmptyOrFalse(res.data!.mobile)) {
              box.write(ArgumentConstant.number, res.data!.mobile.toString());
            }
          }
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
