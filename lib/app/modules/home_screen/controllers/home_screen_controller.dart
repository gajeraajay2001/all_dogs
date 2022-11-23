import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/models/home_screen_data_model.dart';
import 'package:all_dogs/app/models/profile_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../models/video_list_data_model.dart';
import '../../../utilities/progress_dialog_utils.dart';

class HomeScreenController extends GetxController {
  RxList<Posts> postList = RxList<Posts>([]);
  RxList<Blogs> blogList = RxList<Blogs>([]);
  RxList<Videos> videoList = RxList<Videos>([]);
  YoutubePlayerController? youtubePlayerController;
  RxBool hasData = false.obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!isNullEmptyOrFalse(box.read(ArgumentConstant.token))) {
        getUserProfileData(context: Get.context!);
      } else {
        getHomeScreenData(context: Get.context!);
      }
    });

    super.onInit();
  }

  getHomeScreenData({required BuildContext context}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};
    print("3333333");
    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.homeDataApi,
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        print("444444444");
        getVideoList(context: context);
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

  getVideoList({
    required BuildContext context,
  }) async {
    hasData.value = false;
    videoList.clear();
    Map<String, dynamic> dict = {};
    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.videoListApi + "?page=1&limit=3",
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        VideoDataModel res = VideoDataModel.fromJson(response);

        hasData.value = true;
        if (!isNullEmptyOrFalse(res)) {
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.videos)) {
              res.data!.videos!.forEach((element) {
                videoList.add(element);
              });
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
        print("1111111111");
        if (response["responseCode"] == 200) {
          print("22222222");
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
        } else {
          hasData.value = true;
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
