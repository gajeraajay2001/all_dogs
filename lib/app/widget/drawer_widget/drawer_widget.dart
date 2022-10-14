import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import '../../routes/app_pages.dart';
import '../../utilities/buttons.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MySize.getWidth(264),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MySize.getHeight(50),
                  width: MySize.safeWidth,
                  decoration: BoxDecoration(
                    color: appTheme.primaryTheme,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath + "logo1.png",
                    fit: BoxFit.cover,
                    height: MySize.getHeight(25),
                    width: MySize.getWidth(130),
                  ),
                ),
                Positioned(
                  right: MySize.getHeight(15),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: MySize.getHeight(50),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: MySize.getHeight(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            getButtonWidget(
                title: "Puppies",
                isArrowVisible: true,
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.PUPPIES_LIST);
                }),
            SizedBox(
              height: MySize.getHeight(5),
            ),
            getButtonWidget(
                title: "Breeders",
                isArrowVisible: true,
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.BREEDERS_SCREEN);
                }),
            SizedBox(
              height: MySize.getHeight(5),
            ),
            getButtonWidget(
                title: "Breeds",
                isArrowVisible: true,
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.BREEDS_SCREEN);
                }),
            SizedBox(
              height: MySize.getHeight(5),
            ),
            getButtonWidget(
                title: "Blogs",
                isArrowVisible: true,
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.BLOGS_SCREEN);
                }),
            SizedBox(
              height: MySize.getHeight(5),
            ),
            getButtonWidget(
                title: "Create an Ad",
                isArrowVisible: true,
                isPenVisible: true,
                onTap: () {
                  if (isNullEmptyOrFalse(box.read(ArgumentConstant.token))) {
                    Get.back();
                    Get.toNamed(Routes.LOGIN_SCREEN);
                  } else {
                    Get.back();
                    Get.toNamed(Routes.CREATE_ADD);
                  }
                }),
            SizedBox(
              height: MySize.getHeight(10),
            ),
            SizedBox(
              height: MySize.getHeight(5),
              child: Divider(thickness: MySize.getHeight(1)),
            ),
            SizedBox(
              height: MySize.getHeight(2),
            ),
            // getButtonWidget(
            //     title: "My Notification",
            //     onTap: () {
            //       Get.back();
            //     }),
            getButtonWidget(
                title: "My Profile",
                onTap: () {
                  if (isNullEmptyOrFalse(box.read(ArgumentConstant.token))) {
                    Get.back();
                    Get.toNamed(Routes.LOGIN_SCREEN);
                  } else {
                    Get.back();
                    Get.toNamed(Routes.PROFILE);
                  }
                }),
            getButtonWidget(
                title: "Contact Us",
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.GET_IN_TOUCH_SCREEN);
                }),
            // getButtonWidget(
            //     title: "Help",
            //     onTap: () {
            //       Get.back();
            //     }),
            getButtonWidget(
                title: "About Us",
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.ABOUT_US_SCREEN);
                }),
            getButtonWidget(
              title: (!isNullEmptyOrFalse(box.read(ArgumentConstant.token)))
                  ? "Logout"
                  : "Login",
              onTap: () {
                if (!isNullEmptyOrFalse(box.read(ArgumentConstant.token))) {
                  Get.back();
                  showConfirmationDialog(
                      context: context,
                      text: "Are you sure you want Logout.",
                      submitText: "Yes",
                      cancelText: "Cancel",
                      submitCallBack: () {
                        getLogOut();
                      },
                      cancelCallback: () {
                        Get.back();
                      });
                } else {
                  Get.back();
                  Get.toNamed(Routes.LOGIN_SCREEN);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget getButtonWidget({
    required String title,
    required void Function() onTap,
    bool isArrowVisible = false,
    bool isPenVisible = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MySize.getHeight(35),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: MySize.getHeight(14),
                        fontWeight: FontWeight.w500),
                  ),
                  Space.width(8),
                  if (isPenVisible)
                    Image.asset(
                      imagePath + "ic_edit.png",
                      color: appTheme.primaryTheme,
                      // fit: BoxFit.cover,
                      height: MySize.getHeight(14),
                      width: MySize.getHeight(14),
                    ),
                ],
              ),
            ),
            if (isArrowVisible)
              Icon(
                Icons.arrow_forward_ios,
                size: MySize.getHeight(14),
                color: Colors.black,
              ),
          ],
        ),
      ),
    );
  }
}
