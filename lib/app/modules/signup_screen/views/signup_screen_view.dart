import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../constants/api_constants.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/buttons.dart';
import '../../../utilities/text_field.dart';
import '../controllers/signup_screen_controller.dart';

class SignupScreenView extends GetWidget<SignupScreenController> {
  const SignupScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing.height(80),
                  Center(
                    child: Container(
                      child: SvgPicture.asset(
                        imagePath + "logo.svg",
                        height: MySize.getHeight(50),
                        width: MySize.getWidth(100),
                      ),
                    ),
                  ),
                  Spacing.height(60),
                  Center(
                    child: Text(
                      "Create An Account",
                      style: TextStyle(
                        fontSize: MySize.getHeight(20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacing.height(16),
                  Center(
                    child: Text(
                      "Please fill out this form to register with us",
                      style: TextStyle(
                        fontSize: MySize.getHeight(12),
                      ),
                    ),
                  ),
                  Spacing.height(30),
                  Text(
                    "NAME :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MySize.getHeight(15)),
                  ),
                  Spacing.height(15),
                  getTextField(
                      textEditingController: controller.nameController,
                      hintText: "Enter name here"),
                  Spacing.height(25),
                  Text(
                    "EMAIL :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MySize.getHeight(15)),
                  ),
                  Spacing.height(15),
                  getTextField(
                      textEditingController: controller.emailController,
                      hintText: "Enter email here"),
                  Spacing.height(25),
                  Text(
                    "MOBILE NO. :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MySize.getHeight(15)),
                  ),
                  Spacing.height(15),
                  getTextField(
                      textEditingController: controller.mobileNumberController,
                      hintText: "10 digit mobile"),
                  Spacing.height(25),
                  Text(
                    "PASSWORD :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MySize.getHeight(15)),
                  ),
                  Spacing.height(15),
                  getTextField(
                    textEditingController: controller.passwordController,
                    hintText: "Enter password here",
                    textVisible: !controller.isVisible1.value,
                    suffixIcon: InkWell(
                        onTap: () {
                          controller.isVisible1.toggle();
                        },
                        child: Icon(
                          (controller.isVisible1.isTrue)
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        )),
                  ),
                  Spacing.height(25),
                  Text(
                    "CONFIRM PASSWORD :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MySize.getHeight(15)),
                  ),
                  Spacing.height(15),
                  getTextField(
                    textEditingController: controller.confirmPasswordController,
                    hintText: "Confirm password here",
                    textVisible: !controller.isVisible2.value,
                    suffixIcon: InkWell(
                        onTap: () {
                          controller.isVisible2.toggle();
                        },
                        child: Icon(
                          (controller.isVisible2.isTrue)
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        )),
                  ),
                  Spacing.height(60),
                  Center(
                      child: getButton(
                          title: "REGISTER", width: 125, textSize: 15)),
                  Spacing.height(15),
                  Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "Have an account?",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: " Login",
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => Get.offAllNamed(Routes.LOGIN_SCREEN),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appTheme.secondaryTheme)),
                      ]),
                    ),
                  ),
                  Spacing.height(50),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
