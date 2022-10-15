import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/utilities/progress_dialog_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class MySize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late bool isMini;
  static double? safeWidth;
  static double? safeHeight;

  static late double scaleFactorWidth;
  static late double scaleFactorHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    isMini = _mediaQueryData.size.height < 750;
    double _safeAreaWidth =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    double _safeAreaHeight =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeWidth = (screenWidth - _safeAreaWidth);
    safeHeight = (screenHeight - _safeAreaHeight);

    safeWidth = (screenWidth - _safeAreaWidth);
    safeHeight = (screenHeight - _safeAreaHeight);

    scaleFactorHeight = (safeHeight! / 748);
    if (scaleFactorHeight < 1) {
      double diff = (1 - scaleFactorHeight) * (1 - scaleFactorHeight);
      scaleFactorHeight += diff;
    }

    scaleFactorWidth = (safeWidth! / 360);

    if (scaleFactorWidth < 1) {
      double diff = (1 - scaleFactorWidth) * (1 - scaleFactorWidth);
      scaleFactorWidth += diff;
    }
  }

  static double getWidth(double size) {
    return (size * scaleFactorWidth);
  }

  static double getHeight(double size) {
    return (size * scaleFactorHeight);
  }
}

class Spacing {
  static EdgeInsetsGeometry zero = EdgeInsets.zero;

  static EdgeInsetsGeometry only(
      {double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  }

  static EdgeInsetsGeometry fromLTRB(
      double left, double top, double right, double bottom) {
    return Spacing.only(bottom: bottom, top: top, right: right, left: left);
  }

  static EdgeInsetsGeometry all(double spacing) {
    return Spacing.only(
        bottom: spacing, top: spacing, right: spacing, left: spacing);
  }

  static EdgeInsetsGeometry left(double spacing) {
    return Spacing.only(left: spacing);
  }

  static EdgeInsetsGeometry nLeft(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsetsGeometry top(double spacing) {
    return Spacing.only(top: spacing);
  }

  static EdgeInsetsGeometry nTop(double spacing) {
    return Spacing.only(left: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsetsGeometry right(double spacing) {
    return Spacing.only(right: spacing);
  }

  static EdgeInsetsGeometry nRight(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing, left: spacing);
  }

  static EdgeInsetsGeometry bottom(double spacing) {
    return Spacing.only(bottom: spacing);
  }

  static EdgeInsetsGeometry nBottom(double spacing) {
    return Spacing.only(top: spacing, left: spacing, right: spacing);
  }

  static EdgeInsetsGeometry horizontal(double spacing) {
    return Spacing.only(left: spacing, right: spacing);
  }

  static x(double spacing) {
    return Spacing.only(left: spacing, right: spacing);
  }

  static xy(double xSpacing, double ySpacing) {
    return Spacing.only(
        left: xSpacing, right: xSpacing, top: ySpacing, bottom: ySpacing);
  }

  static y(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsetsGeometry vertical(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsetsGeometry symmetric(
      {double vertical = 0, double horizontal = 0}) {
    return Spacing.only(
        top: vertical, right: horizontal, left: horizontal, bottom: vertical);
  }

  static Widget height(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget width(double width) {
    return SizedBox(
      width: width,
    );
  }
}

class Space {
  Space();

  static Widget height(double space) {
    return SizedBox(
      height: MySize.getHeight(space),
    );
  }

  static Widget width(double space) {
    return SizedBox(
      width: MySize.getHeight(space),
    );
  }
}

enum ShapeTypeFor { container, button }

class Shape {
  static dynamic circular(double radius,
      {ShapeTypeFor shapeTypeFor = ShapeTypeFor.container}) {
    BorderRadius borderRadius =
        BorderRadius.all(Radius.circular(MySize.getHeight(radius)));

    switch (shapeTypeFor) {
      case ShapeTypeFor.container:
        return borderRadius;
      case ShapeTypeFor.button:
        return RoundedRectangleBorder(borderRadius: borderRadius);
    }
  }

  static dynamic circularTop(double radius,
      {ShapeTypeFor shapeTypeFor = ShapeTypeFor.container}) {
    BorderRadius borderRadius = BorderRadius.only(
        topLeft: Radius.circular(MySize.getHeight(radius)),
        topRight: Radius.circular(MySize.getHeight(radius)));
    switch (shapeTypeFor) {
      case ShapeTypeFor.container:
        return borderRadius;

      case ShapeTypeFor.button:
        return RoundedRectangleBorder(borderRadius: borderRadius);
    }
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

getSnackBar(
    {required BuildContext context,
    String text = "",
    double size = 16,
    int duration = 500}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: TextStyle(fontSize: MySize.getHeight(size))),
      duration: Duration(milliseconds: duration),
    ),
  );
}

String getFirstTwoLetterCapital({required String text}) {
  return (!isNullEmptyOrFalse(text))
      ? (text.length == 1)
          ? text.toUpperCase()
          : (text.length >= 2)
              ? "${text[0].toUpperCase()}${text[1].toUpperCase()}"
              : "gkg"
      : "gsg";
}

getGetXSnackBar({String title = "", String msg = ""}) {
  return Get.snackbar(
    title,
    msg,
    snackPosition: SnackPosition.BOTTOM,
  );
}

CachedNetworkImage getImageByLink(
    {required String url,
    required double height,
    required double width,
    bool isLoading = false,
    bool colorFilter = false,
    String imagePlaceHolder = "dog_placeholder.jpeg",
    BoxFit boxFit = BoxFit.contain}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: MySize.getHeight(height),
      width: MySize.getWidth(width),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: boxFit,
          colorFilter: (colorFilter)
              ? ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken)
              : null,
        ),
      ),
    ),
    placeholder: (context, url) => Container(
      height: height,
      width: width,
      child: LinearProgressIndicator(
        color: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade100,
      ),
    ),
    errorWidget: (context, url, error) => Image(
        image: AssetImage(imagePath + imagePlaceHolder),
        height: height,
        width: width,
        fit: boxFit),
  );
}

urlLauncher({required Uri url}) async {
  if (await launchUrl(url).catchError((error) async {
    await getIt<CustomDialogs>().getDialog(
        title: "Failed", desc: "Unable to find whatsapp in your device");
    return await false;
  }).then((value) async {
    return await true;
  })) {}
}
