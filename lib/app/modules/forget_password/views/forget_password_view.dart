import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/api_constants.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../utilities/buttons.dart';
import '../../../utilities/text_field.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetWidget<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Image.asset(
                      imagePath + "back_arrow_image.png",
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
                  child: Form(
                    key: controller.formKey.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacing.height(65),
                        Center(
                          child: Container(
                            child: Image.asset(
                              imagePath + "logo.png",
                              height: MySize.getHeight(125),
                              width: MySize.getWidth(320),
                            ),
                          ),
                        ),
                        Spacing.height(10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              fontSize: MySize.getHeight(18),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacing.height(37),
                        getTextField(
                            textEditingController: controller.emailController,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: appTheme.primaryTheme,
                            ),
                            validation: (val) => validateEmail(val),
                            labelText: "Email",
                            hintText: "Enter email here"),
                        Spacing.height(150),
                        Center(
                            child: InkWell(
                                onTap: () {
                                  // Get.toNamed(Routes.HOME_SCREEN);
                                  if (controller.formKey.value.currentState!
                                      .validate()) {
                                    controller.callApiForResetPassword(
                                        context: context);
                                  }
                                },
                                child: getButton(
                                    title: "LOGIN",
                                    width: MySize.screenWidth))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
