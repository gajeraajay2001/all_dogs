import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget getButton({
  required String title,
  double? height,
  double? width,
  Color? backColor,
  double? textSize,
  Color? textColor,
  FontWeight? fontWeight,
  double? borderRadius,
  Widget? widget,
}) {
  return Container(
    height: MySize.getHeight(height ?? 47),
    width: MySize.getWidth(width ?? 150),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: backColor ?? appTheme.primaryTheme,
      borderRadius: BorderRadius.circular(MySize.getHeight(borderRadius ?? 5)),
    ),
    child: (!isNullEmptyOrFalse(widget))
        ? widget
        : Text(
            title,
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: MySize.getHeight(textSize ?? 17),
                fontWeight: fontWeight ?? FontWeight.w500),
          ),
  );
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
}

DateTime getDateFromStringNew(String dateString, {String? formatter}) {
  const String kMainSourceFormat = "yyyy-MM-dd'T'HH:mm:ss";
  if (formatter == null) {
    formatter = kMainSourceFormat;
  }
  return DateFormat(formatter).parse(dateString, true);
}
