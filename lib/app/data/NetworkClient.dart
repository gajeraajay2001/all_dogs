import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/color_constant.dart';
import '../constants/sizeConstant.dart';

class MethodType {
  static const String Post = "POST";
  static const String Get = "GET";
  static const String Put = "PUT";
  static const String Patch = "PATCH";
  static const String Delete = "DELETE";
}

class NetworkClient {
  static NetworkClient? _shared;

  NetworkClient._();

  static NetworkClient get getInstance =>
      _shared = _shared ?? NetworkClient._();

  Dio dio = Dio();

  Map<String, dynamic> getAuthHeaders({String? detailToken}) {
    Map<String, dynamic> authHeaders = Map<String, dynamic>();
    GetStorage box = GetStorage();
    String token = "";
    if (box.read("token") != null) {
      token = box.read("token");
      print("Token:= $token");
    }
    if (!isNullEmptyOrFalse(token)) {
      authHeaders["Authorization"] = "Bearer " + token;
    } else if (!isNullEmptyOrFalse(detailToken)) {
      authHeaders['Authorization'] = detailToken;
    } else {
      authHeaders["Content-Type"] = "application/json";
    }
    return authHeaders;
  }

  Future callApi(
    BuildContext context,
    String baseUrl,
    String command,
    String method, {
    var params,
    Map<String, dynamic>? header,
    Function(dynamic response, String message)? successCallback,
    Function(dynamic message, String statusCode)? failureCallback,
  }) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      failureCallback!("Failed", "No Internet Connection");
    }

    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;

    if (header != null) {
      for (var key in header.keys) {
        dio.options.headers[key] = header[key];
      }
    }

    switch (method) {
      case MethodType.Post:
        Response response =
            await dio.post(baseUrl + command, data: params).catchError((error) {
          print("Error : = $error");
          DioError dioError = error as DioError;
          if (dioError.type == DioErrorType.connectTimeout ||
              dioError.type == DioErrorType.receiveTimeout) {
            failureCallback!("TimeOut", "Something went wrong.");
          }
        });
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;

      case MethodType.Get:
        Response response = await dio
            .get(baseUrl + command, queryParameters: params)
            .catchError((error) {
          print("Error : = $error");
          DioError dioError = error as DioError;
          if (dioError.type == DioErrorType.connectTimeout ||
              dioError.type == DioErrorType.receiveTimeout) {
            failureCallback!("TimeOut", "Something went wrong.");
          }
        });
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;

      case MethodType.Put:
        Response response =
            await dio.put(baseUrl + command, data: params).catchError((error) {
          print("Error : = $error");
          DioError dioError = error as DioError;
          if (dioError.type == DioErrorType.connectTimeout ||
              dioError.type == DioErrorType.receiveTimeout) {
            failureCallback!("TimeOut", "Something went wrong.");
          }
        });
        ;
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;
      case MethodType.Patch:
        Response response = await dio
            .patch(baseUrl + command, data: params)
            .catchError((error) {
          print("Error : = $error");
          DioError dioError = error as DioError;
          if (dioError.type == DioErrorType.connectTimeout ||
              dioError.type == DioErrorType.receiveTimeout) {
            failureCallback!("TimeOut", "Something went wrong.");
          }
        });
        ;
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;

      case MethodType.Delete:
        Response response = await dio
            .delete(baseUrl + command, data: params)
            .catchError((error) {
          print("Error : = $error");
          DioError dioError = error as DioError;
          if (dioError.type == DioErrorType.connectTimeout ||
              dioError.type == DioErrorType.receiveTimeout) {
            failureCallback!("TimeOut", "Something went wrong.");
          }
        });
        ;
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;

      default:
    }
  }

  parseResponse(BuildContext context, Response response,
      {Function(dynamic response, String message)? successCallback,
      Function(dynamic statusCode, String message)? failureCallback}) {
    // app.resolve<CustomDialogs>().showCircularDialog(context);
    String statusCode = "response.data['code']";
    String message = "Something went wrong.";

    if (response.statusCode == 200 || response.statusCode == 201) {
      hideDialog(true, context);
      if (isNullEmptyOrFalse(response.data)) {
        successCallback!(response.statusCode, message);
        return;
      }
      if (response.data is Map<String, dynamic> ||
          response.data is List<dynamic>) {
        successCallback!(response.data, message);
        return;
      } else if (response.data is List<Map<String, dynamic>>) {
        successCallback!(response.data, response.statusMessage.toString());
        return;
      } else if (!isNullEmptyOrFalse(response.data)) {
        successCallback!(response.data, response.statusMessage.toString());
        return;
      } else {
        failureCallback!(response.data, "Something went wrong.");
        return;
      }
    } else if (response.statusCode == 400) {
      if (!isNullEmptyOrFalse(response.data)) {
        hideDialog(true, context);

        failureCallback!(response.statusCode, "Something went wrong.");
        return;
      } else {
        hideDialog(true, context);

        failureCallback!(response.statusCode, "Something went wrong.");
        return;
      }
    } else if (response.statusCode == 500) {
      failureCallback!(response.data, "Something went wrong.");
      return;
    } else {
      hideDialog(true, context);

      failureCallback!(response.statusCode, "Something went wrong.");
      return;
    }
  }

  void hideDialog(bool isProgress, BuildContext context) {
    if (isProgress) {
      // app.resolve<CustomDialogs>().hideCircularDialog(context);
    }
  }

  getDialog(
      {String title = "Error", String desc = "Some Thing went wrong...."}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: title,
        content: Text(desc),
        buttonColor: appTheme.primaryTheme,
        textConfirm: "Ok",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        });
  }
}
