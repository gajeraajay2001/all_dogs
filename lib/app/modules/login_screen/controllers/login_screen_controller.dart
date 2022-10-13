import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/progress_dialog_utils.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isVisible = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  callApiForLogin({
    required BuildContext context,
  }) {
    FocusScope.of(context).unfocus();
    getIt.get<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["email"] = emailController.value.text;
    dict["password"] = passwordController.value.text;
    FormData formData = new FormData.fromMap(dict);

    // print(token);

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.login,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);

        if (response["responseCode"] == 200) {
          LogInResponse logInResponse = LogInResponse.fromJson(response);
          if (logInResponse.data!.token != null) {
            box.write(ArgumentConstant.token, logInResponse.data!.token);
            box.write(ArgumentConstant.password, passwordController.value.text);
          }
          Get.offAllNamed(Routes.HOME_SCREEN);
        } else {
          getIt
              .get<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (status, message) {
        getIt.get<CustomDialogs>().hideCircularDialog(context);

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

class LogInResponse {
  int? responseCode;
  Data? data;
  String? message;

  LogInResponse({this.responseCode, this.data, this.message});

  LogInResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;
  String? id;
  String? pic;
  String? email;
  String? mobile;
  String? name;

  Data({this.token, this.id, this.pic, this.email, this.mobile, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    pic = json['pic'];
    email = json['email'];
    mobile = json['mobile'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;
    data['pic'] = this.pic;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    return data;
  }
}
