import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/models/post_detail_model.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class PuppiesDetailsScreenController extends GetxController {
  CarouselController carouselController = CarouselController();
  RxList<String> bannerTextList = RxList<String>([]);
  String postId = "";
  RxInt selectedBannerIndex = 0.obs;
  RxBool hasData = false.obs;
  Post postDetails = Post();
  User userDetails = User();
  RxString viewsCount = "0".obs;

  RxList bannerList = RxList([]);
  @override
  void onInit() {
    if (!isNullEmptyOrFalse(Get.arguments[ArgumentConstant.postId])) {
      postId = Get.arguments[ArgumentConstant.postId];
      getPostDetailsData(
          context: Get.context!, id: Get.arguments[ArgumentConstant.postId]);
    }
    super.onInit();
  }

  getPostDetailsData(
      {required BuildContext context, required String id}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.getPostDetailsApi + id,
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasData.value = true;
        if (response["responseCode"] == 200) {
          PostDetailModel res = PostDetailModel.fromJson(response);
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.post)) {
              postDetails = res.data!.post!;
              if (!isNullEmptyOrFalse(res.data!.post!.views)) {
                viewsCount.value = res.data!.post!.views.toString();
              }
              if (!isNullEmptyOrFalse(res.data!.post!.pic1)) {
                bannerList.add(res.data!.post!.pic1.toString());
                bannerTextList.add(res.data!.post!.pictxt1.toString());
              }
              if (!isNullEmptyOrFalse(res.data!.post!.pic2)) {
                bannerList.add(res.data!.post!.pic2.toString());
                bannerTextList.add(res.data!.post!.pictxt2.toString());
              }
              if (!isNullEmptyOrFalse(res.data!.post!.pic3)) {
                bannerList.add(res.data!.post!.pic3.toString());
                bannerTextList.add(res.data!.post!.pictxt3.toString());
              }
              if (!isNullEmptyOrFalse(res.data!.post!.pic4)) {
                bannerList.add(res.data!.post!.pic4.toString());
                bannerTextList.add(res.data!.post!.pictxt4.toString());
              }
              if (!isNullEmptyOrFalse(res.data!.post!.pic5)) {
                bannerList.add(res.data!.post!.pic5.toString());
                bannerTextList.add(res.data!.post!.pictxt5.toString());
              }
              if (!isNullEmptyOrFalse(res.data!.post!.pic6)) {
                bannerList.add(res.data!.post!.pic6.toString());
                bannerTextList.add(res.data!.post!.pictxt6.toString());
              }
              if (!isNullEmptyOrFalse(res.data!.post!.pic7)) {
                bannerList.add(res.data!.post!.pic7.toString());
                bannerTextList.add(res.data!.post!.pictxt7.toString());
              }
              if (!isNullEmptyOrFalse(res.data!.post!.pic8)) {
                bannerList.add(res.data!.post!.pic8.toString());
                bannerTextList.add(res.data!.post!.pictxt8.toString());
              }
              if (!isNullEmptyOrFalse(res.data!.post!.pic9)) {
                bannerList.add(res.data!.post!.pic9.toString());
                bannerTextList.add(res.data!.post!.pictxt9.toString());
              }
              if (!isNullEmptyOrFalse(res.data!.post!.pic10)) {
                bannerList.add(res.data!.post!.pic10.toString());
                bannerTextList.add(res.data!.post!.pictxt10.toString());
              }
            }
            if (!isNullEmptyOrFalse(res.data!.user)) {
              userDetails = res.data!.user!;
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

  likePostApi(
      {required BuildContext context,
      required String id,
      required bool isLiked}) async {
    // getIt<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.likePostApi + id + "/${isLiked.toString()}",
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        // getIt<CustomDialogs>().hideCircularDialog(context);

        if (response["responseCode"] == 200) {
        } else {
          getIt<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (response, message) {
        // getIt<CustomDialogs>().hideCircularDialog(context);
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
