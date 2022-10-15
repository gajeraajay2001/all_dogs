import 'package:all_dogs/app/models/breeds_detials_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../constants/sizeConstant.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class BreedsDetailsScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  TextEditingController commentController = TextEditingController();
  RxList<Comments> commentList = RxList<Comments>([]);
  RxBool isScrollerJumpToLast = false.obs;
  RxBool hasCommentData = false.obs;
  RxBool hasData = false.obs;
  String breedersId = "";
  String url = "";
  @override
  void onInit() {
    if (!isNullEmptyOrFalse(Get.arguments[ArgumentConstant.breedersId])) {
      breedersId = Get.arguments[ArgumentConstant.breedersId];
      getBreedersDetailsData(context: Get.context!, id: breedersId);
    }
    super.onInit();
  }

  getBreedersDetailsData(
      {required BuildContext context, required String id}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.breedsDetailsApi + id,
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasData.value = true;
        if (response["responseCode"] == 200) {
          BreedsDetailsModel res = BreedsDetailsModel.fromJson(response);
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.breed)) {
              if (!isNullEmptyOrFalse(res.data!.breed!.filename)) {
                url = "https://alldogs.in/breeds/${res.data!.breed!.filename}";
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
        getIt<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print(" error");
      },
    );
  }

  getCommentsData({required BuildContext context, required String id}) async {
    commentList.clear();
    hasCommentData.value = false;
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.breedsDetailsApi + id,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasCommentData.value = true;
        if (response["responseCode"] == 200) {
          BreedsDetailsModel res = BreedsDetailsModel.fromJson(response);
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.comments)) {
              res.data!.comments!.forEach((element) {
                commentList.add(element);
              });
            }
            commentList.value = commentList.reversed.toList();
          }
        } else {
          getIt<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (response, message) {
        hasCommentData.value = true;
        getIt<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print(" error");
      },
    );
  }

  commentApi(
      {required BuildContext context,
      required String id,
      required String comment}) async {
    Map<String, dynamic> dict = {};
    dict["comment"] = comment;
    FormData formData = FormData.fromMap(dict);
    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.breedsCommentApi + id,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        hasData.value = true;
        if (response["responseCode"] == 200) {
          Get.back();
        } else {
          getIt<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
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
