import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/color_constant.dart';
import '../constants/sizeConstant.dart';

TextFormField getTextField({
  String? hintText,
  String? labelText,
  TextEditingController? textEditingController,
  Widget? prefixIcon,
  double? borderRadius,
  Widget? suffixIcon,
  double? size = 52,
  Widget? suffix,
  Color? borderColor,
  Color? fillColor,
  Color? labelColor,
  TextInputType textInputType = TextInputType.name,
  TextInputAction textInputAction = TextInputAction.next,
  bool textVisible = false,
  bool readOnly = false,
  VoidCallback? onTap,
  int maxLine = 1,
  String errorText = "",
  Function(String)? onChange,
  FormFieldValidator<String>? validation,
}) {
  return TextFormField(
    controller: textEditingController,
    obscureText: textVisible,
    textInputAction: textInputAction,
    keyboardType: textInputType,
    cursorColor: appTheme.secondaryTheme,
    readOnly: readOnly,
    validator: validation,
    onTap: onTap,
    maxLines: maxLine,
    onChanged: onChange,
    decoration: InputDecoration(
      // fillColor: fillColor ?? appTheme.textGrayColor,
      // filled: true,
      labelText: labelText,
      labelStyle: TextStyle(
          color: labelColor ?? appTheme.secondaryTheme,
          fontWeight: FontWeight.w600),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? appTheme.secondaryTheme),
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.getHeight(5) : borderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.getHeight(5) : borderRadius),
        borderSide: BorderSide(color: borderColor ?? appTheme.secondaryTheme),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.getHeight(5) : borderRadius),
        borderSide: BorderSide(color: borderColor ?? appTheme.secondaryTheme),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.getHeight(5) : borderRadius),
      ),
      contentPadding: EdgeInsets.only(
        left: MySize.size20!,
        right: MySize.size10!,
        bottom: size! / 2, // HERE THE IMPORTANT PART
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: (isNullEmptyOrFalse(errorText)) ? null : errorText,
      hintText: hintText,
      hintStyle:
          TextStyle(fontSize: MySize.size14!, color: Colors.grey.shade500),
    ),
  );
}
