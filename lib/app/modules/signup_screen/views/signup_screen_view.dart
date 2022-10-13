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
                Positioned(
                  top: MySize.getHeight(10),
                  left: MySize.getWidth(5),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: MySize.getHeight(20),
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
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: MySize.getHeight(18),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacing.height(37),
                        getTextField(
                            textEditingController: controller.nameController,
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: appTheme.primaryTheme,
                            ),
                            textCapitalization: TextCapitalization.sentences,
                            labelText: "Name",
                            validation: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Name";
                              }
                              return null;
                            },
                            hintText: "Enter name here"),
                        Spacing.height(30),
                        getTextField(
                            textEditingController: controller.emailController,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: appTheme.primaryTheme,
                            ),
                            validation: (val) => validateEmail(val),
                            labelText: "Email",
                            textInputType: TextInputType.emailAddress,
                            hintText: "Enter email here"),
                        Spacing.height(30),
                        getTextField(
                            textEditingController:
                                controller.mobileNumberController,
                            prefixIcon: Icon(
                              Icons.call_outlined,
                              color: appTheme.primaryTheme,
                            ),
                            labelText: "Mobile No.",
                            textInputType: TextInputType.number,
                            validation: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Mobile Number";
                              }
                              if (val.trim().length != 10) {
                                return "Please Enter Valid Number";
                              }
                              return null;
                            },
                            hintText: "Enter your number"),
                        Spacing.height(30),
                        getTextField(
                          textEditingController: controller.passwordController,
                          hintText: "Enter password here",
                          validation: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Password";
                            }
                            return null;
                          },
                          textVisible: !controller.isVisible1.value,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: appTheme.primaryTheme,
                          ),
                          labelText: "Password",
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
                        getTextField(
                          textEditingController:
                              controller.confirmPasswordController,
                          hintText: "Confirm password here",
                          textVisible: !controller.isVisible2.value,
                          validation: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Password";
                            }
                            if (val != controller.passwordController.value.text)
                              return 'Not match both password';
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: appTheme.primaryTheme,
                          ),
                          labelText: "Confirm Password",
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
                            child: InkWell(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.callApiForSignUp(context: context);
                            }
                          },
                          child: getButton(
                              title: "SIGN UP",
                              width: MySize.screenWidth,
                              textSize: 17),
                        )),
                        Spacing.height(15),
                        Center(
                          child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: "Have an account?",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: MySize.getHeight(13))),
                              TextSpan(
                                  text: " Sign in!",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.back(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: MySize.getHeight(14))),
                            ]),
                          ),
                        ),
                        Spacing.height(50),
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
