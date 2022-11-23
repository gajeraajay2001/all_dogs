import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../models/video_list_data_model.dart';
import '../../../utilities/progress_dialog_utils.dart';

class VideoScreenController extends GetxController {
  RxBool hasData = false.obs;
  RxInt page = 1.obs;
  RxInt pageLimit = 10.obs;
  RxBool allDataLoaded = false.obs;
  RxList<Videos> videoList = RxList<Videos>([]);
  late ScrollController scrollController;
  YoutubePlayerController? youtubePlayerController;
  @override
  void onInit() {
    scrollController = ScrollController()..addListener(loadMore);
    getVideoList(context: Get.context!);
    super.onInit();
  }

  void loadMore() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (allDataLoaded.isFalse) {
        page.value++;
        getVideoList(context: Get.context!, isMoreDataLoad: true);
      }
    }
  }

  getVideoList({
    required BuildContext context,
    bool isFromSearch = false,
    bool isMoreDataLoad = false,
  }) async {
    if (!isMoreDataLoad) {
      hasData.value = false;
    }
    Map<String, dynamic> dict = {};
    if (isFromSearch) {
      page.value = 1;
      videoList.clear();
    }
    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.videoListApi + "?page=${page.value}&limit=8",
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        VideoDataModel res = VideoDataModel.fromJson(response);
        if (!isMoreDataLoad) {
          hasData.value = true;
        }
        if (!isNullEmptyOrFalse(res)) {
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.videos)) {
              res.data!.videos!.forEach((element) {
                videoList.add(element);
              });
            } else {
              allDataLoaded.value = true;
              hasData.value = true;
            }
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
