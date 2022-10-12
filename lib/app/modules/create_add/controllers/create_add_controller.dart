import 'dart:io';

import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:intl/intl.dart';
import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../models/post_detail_model.dart';
import '../../../utilities/progress_dialog_utils.dart';

class CreateAddController extends GetxController {
  RxBool hasData = true.obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;
  Rx<TextEditingController> breedController = TextEditingController().obs;
  Rx<TextEditingController> dob1Controller = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> youtubeController = TextEditingController().obs;
  Rx<TextEditingController> text1Controller = TextEditingController().obs;
  Rx<TextEditingController> pic1Controller = TextEditingController().obs;
  Rx<TextEditingController> text2Controller = TextEditingController().obs;
  Rx<TextEditingController> pic2Controller = TextEditingController().obs;
  Rx<TextEditingController> text3Controller = TextEditingController().obs;
  Rx<TextEditingController> pic3Controller = TextEditingController().obs;
  Rx<TextEditingController> text4Controller = TextEditingController().obs;
  Rx<TextEditingController> pic4Controller = TextEditingController().obs;
  Rx<TextEditingController> text5Controller = TextEditingController().obs;
  Rx<TextEditingController> pic5Controller = TextEditingController().obs;
  Rx<TextEditingController> text6Controller = TextEditingController().obs;
  Rx<TextEditingController> pic6Controller = TextEditingController().obs;
  Rx<TextEditingController> text7Controller = TextEditingController().obs;
  Rx<TextEditingController> pic7Controller = TextEditingController().obs;
  Rx<TextEditingController> text8Controller = TextEditingController().obs;
  Rx<TextEditingController> pic8Controller = TextEditingController().obs;
  Rx<TextEditingController> text9Controller = TextEditingController().obs;
  Rx<TextEditingController> pic9Controller = TextEditingController().obs;
  Rx<TextEditingController> text10Controller = TextEditingController().obs;
  Rx<TextEditingController> pic10Controller = TextEditingController().obs;

  Rx<File?>? image1;
  String? imgFileName1;
  Rx<File?>? image2;
  String? imgFileName2;
  Rx<File?>? image3;
  String? imgFileName3;
  Rx<File?>? image4;
  String? imgFileName4;
  Rx<File?>? image5;
  String? imgFileName5;
  Rx<File?>? image6;
  String? imgFileName6;
  Rx<File?>? image7;
  String? imgFileName7;
  Rx<File?>? image8;
  String? imgFileName8;
  Rx<File?>? image9;
  String? imgFileName9;
  Rx<File?>? image10;
  String? imgFileName10;
  Post postDetails = Post();
  User userDetails = User();
  RxBool hasChecked = false.obs;
  bool isForEdit = false;
  String postId = "";
  final count = 0.obs;
  @override
  void onInit() {
    if (!isNullEmptyOrFalse(Get.arguments)) {
      isForEdit = Get.arguments[ArgumentConstant.isForEditPost];
      postId = Get.arguments[ArgumentConstant.postId];
      getPostDetailsData(
          context: Get.context!, id: Get.arguments[ArgumentConstant.postId]);
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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

              if (!isNullEmptyOrFalse(postDetails.title)) {
                titleController.value.text = postDetails.title.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.body)) {
                bodyController.value.text = postDetails.body.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.breed)) {
                breedController.value.text = postDetails.breed.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.dateTimeDOB)) {
                dateController.value.text =
                    DateFormat("dd-MM-yyyy").format(postDetails.dateTimeDOB!);
                dob1Controller.value.text =
                    DateFormat("yyy-MM-dd").format(postDetails.dateTimeDOB!);
              }
              if (!isNullEmptyOrFalse(postDetails.location)) {
                locationController.value.text = postDetails.location.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.available)) {
                hasChecked.value = (postDetails.available.toString() == "1");
              }
              if (!isNullEmptyOrFalse(postDetails.video)) {
                youtubeController.value.text = postDetails.video.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pictxt1)) {
                text1Controller.value.text = postDetails.pictxt1.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pictxt2)) {
                text2Controller.value.text = postDetails.pictxt2.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pictxt3)) {
                text3Controller.value.text = postDetails.pictxt3.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pictxt4)) {
                text4Controller.value.text = postDetails.pictxt4.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pictxt5)) {
                text5Controller.value.text = postDetails.pictxt5.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pictxt6)) {
                text6Controller.value.text = postDetails.pictxt6.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pictxt7)) {
                text7Controller.value.text = postDetails.pictxt7.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pictxt8)) {
                text8Controller.value.text = postDetails.pictxt8.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pictxt9)) {
                text9Controller.value.text = postDetails.pictxt9.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pictxt10)) {
                text10Controller.value.text = postDetails.pictxt10.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pic1)) {
                pic1Controller.value.text = postDetails.pic1.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pic2)) {
                pic2Controller.value.text = postDetails.pic2.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pic3)) {
                pic3Controller.value.text = postDetails.pic3.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pic4)) {
                pic4Controller.value.text = postDetails.pic4.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pic5)) {
                pic5Controller.value.text = postDetails.pic5.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pic6)) {
                pic6Controller.value.text = postDetails.pic6.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pic7)) {
                pic7Controller.value.text = postDetails.pic7.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pic8)) {
                pic8Controller.value.text = postDetails.pic8.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pic9)) {
                pic9Controller.value.text = postDetails.pic9.toString();
              }
              if (!isNullEmptyOrFalse(postDetails.pic10)) {
                pic10Controller.value.text = postDetails.pic10.toString();
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

  callApiForCreatePost({
    required BuildContext context,
  }) async {
    FocusScope.of(context).unfocus();
    getIt.get<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["title"] = titleController.value.text;
    dict["body"] = bodyController.value.text;
    dict["breed"] = breedController.value.text;
    dict["dob"] = dob1Controller.value.text;
    dict["location"] = locationController.value.text;
    dict["video"] = youtubeController.value.text;
    dict["available"] = hasChecked.value;
    if (image1 != null) {
      dict["pic1"] = await MultipartFile.fromFile(image1!.value!.path,
          filename: imgFileName1);
    }
    if (!isNullEmptyOrFalse(text1Controller.value.text)) {
      dict["pictxt1"] = text1Controller.value.text;
    }
    if (image2 != null) {
      dict["pic2"] = await MultipartFile.fromFile(image2!.value!.path,
          filename: imgFileName2);
    }
    if (!isNullEmptyOrFalse(text2Controller.value.text)) {
      dict["pictxt2"] = text2Controller.value.text;
    }
    if (image3 != null) {
      dict["pic3"] = await MultipartFile.fromFile(image3!.value!.path,
          filename: imgFileName3);
    }
    if (!isNullEmptyOrFalse(text3Controller.value.text)) {
      dict["pictxt3"] = text3Controller.value.text;
    }
    if (image4 != null) {
      dict["pic4"] = await MultipartFile.fromFile(image4!.value!.path,
          filename: imgFileName4);
    }
    if (!isNullEmptyOrFalse(text4Controller.value.text)) {
      dict["pictxt4"] = text4Controller.value.text;
    }
    if (image5 != null) {
      dict["pic5"] = await MultipartFile.fromFile(image5!.value!.path,
          filename: imgFileName5);
    }
    if (!isNullEmptyOrFalse(text5Controller.value.text)) {
      dict["pictxt5"] = text5Controller.value.text;
    }
    if (image6 != null) {
      dict["pic6"] = await MultipartFile.fromFile(image6!.value!.path,
          filename: imgFileName6);
    }
    if (!isNullEmptyOrFalse(text6Controller.value.text)) {
      dict["pictxt6"] = text6Controller.value.text;
    }
    if (image7 != null) {
      dict["pic7"] = await MultipartFile.fromFile(image7!.value!.path,
          filename: imgFileName7);
    }
    if (!isNullEmptyOrFalse(text7Controller.value.text)) {
      dict["pictxt7"] = text7Controller.value.text;
    }
    if (image8 != null) {
      dict["pic8"] = await MultipartFile.fromFile(image8!.value!.path,
          filename: imgFileName8);
    }
    if (!isNullEmptyOrFalse(text8Controller.value.text)) {
      dict["pictxt8"] = text8Controller.value.text;
    }
    if (image9 != null) {
      dict["pic9"] = await MultipartFile.fromFile(image9!.value!.path,
          filename: imgFileName9);
    }
    if (!isNullEmptyOrFalse(text9Controller.value.text)) {
      dict["pictxt9"] = text9Controller.value.text;
    }
    if (image10 != null) {
      dict["pic10"] = await MultipartFile.fromFile(image10!.value!.path,
          filename: imgFileName10);
    }
    if (!isNullEmptyOrFalse(text10Controller.value.text)) {
      dict["pictxt10"] = text10Controller.value.text;
    }

    FormData formData = new FormData.fromMap(dict);

    // print(token);

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.postCreateApi,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);

        if (response["responseCode"] == 200) {
          Get.offAllNamed(Routes.HOME_SCREEN);
        } else {
          getIt
              .get<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (status, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);

        getIt
            .get<CustomDialogs>()
            .getDialog(title: "Failed", desc: status["message"]);
        print(" error");
      },
    );
  }

  callApiForDeletePostPic(
      {required BuildContext context,
      required Rx<TextEditingController> textEditingControllerPic,
      required Rx<TextEditingController> textEditingControllertext,
      required String key}) async {
    FocusScope.of(context).unfocus();
    getIt.get<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};

    dict[key] = true;

    FormData formData = new FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.deletePostPic + postId,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);

        if (response["responseCode"] == 200) {
          textEditingControllerPic.value.clear();
          textEditingControllertext.value.clear();
          textEditingControllerPic.refresh();
          textEditingControllertext.refresh();
        } else {
          getIt
              .get<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (status, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);

        getIt
            .get<CustomDialogs>()
            .getDialog(title: "Failed", desc: status["message"]);
        print(" error");
      },
    );
  }

  callApiForEditPost({
    required BuildContext context,
  }) async {
    FocusScope.of(context).unfocus();
    getIt.get<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["title"] = titleController.value.text;
    dict["body"] = bodyController.value.text;
    dict["breed"] = breedController.value.text;
    dict["dob"] = dob1Controller.value.text;
    dict["location"] = locationController.value.text;
    dict["video"] = youtubeController.value.text;
    dict["available"] = hasChecked.value;
    if (image1 != null) {
      dict["pic1"] = await MultipartFile.fromFile(image1!.value!.path,
          filename: imgFileName1);
    }
    if (!isNullEmptyOrFalse(text1Controller.value.text)) {
      dict["pictxt1"] = text1Controller.value.text;
    }
    if (image2 != null) {
      dict["pic2"] = await MultipartFile.fromFile(image2!.value!.path,
          filename: imgFileName2);
    }
    if (!isNullEmptyOrFalse(text2Controller.value.text)) {
      dict["pictxt2"] = text2Controller.value.text;
    }
    if (image3 != null) {
      dict["pic3"] = await MultipartFile.fromFile(image3!.value!.path,
          filename: imgFileName3);
    }
    if (!isNullEmptyOrFalse(text3Controller.value.text)) {
      dict["pictxt3"] = text3Controller.value.text;
    }
    if (image4 != null) {
      dict["pic4"] = await MultipartFile.fromFile(image4!.value!.path,
          filename: imgFileName4);
    }
    if (!isNullEmptyOrFalse(text4Controller.value.text)) {
      dict["pictxt4"] = text4Controller.value.text;
    }
    if (image5 != null) {
      dict["pic5"] = await MultipartFile.fromFile(image5!.value!.path,
          filename: imgFileName5);
    }
    if (!isNullEmptyOrFalse(text5Controller.value.text)) {
      dict["pictxt5"] = text5Controller.value.text;
    }
    if (image6 != null) {
      dict["pic6"] = await MultipartFile.fromFile(image6!.value!.path,
          filename: imgFileName6);
    }
    if (!isNullEmptyOrFalse(text6Controller.value.text)) {
      dict["pictxt6"] = text6Controller.value.text;
    }
    if (image7 != null) {
      dict["pic7"] = await MultipartFile.fromFile(image7!.value!.path,
          filename: imgFileName7);
    }
    if (!isNullEmptyOrFalse(text7Controller.value.text)) {
      dict["pictxt7"] = text7Controller.value.text;
    }
    if (image8 != null) {
      dict["pic8"] = await MultipartFile.fromFile(image8!.value!.path,
          filename: imgFileName8);
    }
    if (!isNullEmptyOrFalse(text8Controller.value.text)) {
      dict["pictxt8"] = text8Controller.value.text;
    }
    if (image9 != null) {
      dict["pic9"] = await MultipartFile.fromFile(image9!.value!.path,
          filename: imgFileName9);
    }
    if (!isNullEmptyOrFalse(text9Controller.value.text)) {
      dict["pictxt9"] = text9Controller.value.text;
    }
    if (image10 != null) {
      dict["pic10"] = await MultipartFile.fromFile(image10!.value!.path,
          filename: imgFileName10);
    }
    if (!isNullEmptyOrFalse(text10Controller.value.text)) {
      dict["pictxt10"] = text10Controller.value.text;
    }

    FormData formData = new FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.editPost + postId,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);
        if (response["responseCode"] == 200) {
          Get.offAllNamed(Routes.HOME_SCREEN);
        } else {
          getIt
              .get<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (status, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);

        getIt
            .get<CustomDialogs>()
            .getDialog(title: "Failed", desc: status["message"]);
        print(" error");
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
