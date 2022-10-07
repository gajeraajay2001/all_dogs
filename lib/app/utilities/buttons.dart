import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:flutter/material.dart';

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
      color: backColor ?? appTheme.secondaryTheme,
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
