import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/utilities/buttons.dart';
import 'package:all_dogs/app/utilities/progress_dialog_utils.dart';
import 'package:all_dogs/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/text_field.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetWidget<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);

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
                    key: controller.formKey,
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
                            "LOGIN",
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
                              color: appTheme.secondaryTheme,
                            ),
                            validation: (val) => validateEmail(val),
                            labelText: "Email",
                            hintText: "Enter email here"),
                        Spacing.height(35),
                        getTextField(
                          textEditingController: controller.passwordController,
                          hintText: "Enter password here",
                          textVisible: !controller.isVisible.value,
                          validation: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Password";
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: appTheme.secondaryTheme,
                          ),
                          labelText: "Password",
                          suffixIcon: InkWell(
                              onTap: () {
                                controller.isVisible.toggle();
                              },
                              child: Icon(
                                (controller.isVisible.isTrue)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              )),
                        ),
                        Spacing.height(10),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.FORGET_PASSWORD);
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: MySize.getHeight(11),
                                decoration: TextDecoration.underline,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                        Spacing.height(150),
                        Center(
                            child: InkWell(
                                onTap: () {
                                  //Get.toNamed(Routes.HOME_SCREEN);
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.callApiForLogin(
                                        context: context);
                                  }
                                },
                                child: getButton(
                                    title: "LOGIN",
                                    width: MySize.screenWidth))),
                        Spacing.height(15),
                        Center(
                          child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: "No account?",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: MySize.getHeight(11))),
                              TextSpan(
                                  text: " Sign Up!",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => Get.toNamed(Routes.SIGNUP_SCREEN),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: MySize.getHeight(12))),
                            ]),
                          ),
                        ),
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
