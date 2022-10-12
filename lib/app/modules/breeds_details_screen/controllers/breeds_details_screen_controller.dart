import 'package:all_dogs/app/models/breeds_detials_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../constants/sizeConstant.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class BreedsDetailsScreenController extends GetxController {
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
                url =
                    "https://alldogs.in/breeds/show/${res.data!.breed!.breedSlug}";
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
