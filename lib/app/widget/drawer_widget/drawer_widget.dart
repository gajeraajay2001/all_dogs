import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/utilities/progress_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../routes/app_pages.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MySize.getWidth(200),
      child: Container(
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.only(left: MySize.getWidth(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MySize.getHeight(50),
              width: MySize.safeWidth,
              decoration: BoxDecoration(
                color: appTheme.primaryTheme,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: MySize.getWidth(20)),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: MySize.getHeight(20),
              ),
            ),
            ListTile(
              title: Text(
                "Puppies",
                style: TextStyle(fontSize: MySize.getHeight(14)),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: MySize.getHeight(16)),
              onTap: () {
                Get.back();

                Get.toNamed(Routes.PUPPIES_LIST);
              },
            ),
            SizedBox(
              height: MySize.getHeight(5),
              child: Divider(thickness: MySize.getHeight(1)),
            ),
            ListTile(
              title: Text(
                "Breeders",
                style: TextStyle(fontSize: MySize.getHeight(14)),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: MySize.getHeight(16)),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.BREEDERS_SCREEN);
              },
            ),
            SizedBox(
              height: MySize.getHeight(5),
              child: Divider(thickness: MySize.getHeight(1)),
            ),
            ListTile(
              title: Text(
                "Breeds",
                style: TextStyle(fontSize: MySize.getHeight(14)),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: MySize.getHeight(16)),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.BREEDS_SCREEN);
              },
            ),
            SizedBox(
              height: MySize.getHeight(5),
              child: Divider(thickness: MySize.getHeight(1)),
            ),
            ListTile(
              title: Text(
                "Blogs",
                style: TextStyle(fontSize: MySize.getHeight(14)),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: MySize.getHeight(16)),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.BLOGS_SCREEN);
              },
            ),
            SizedBox(
              height: MySize.getHeight(5),
              child: Divider(thickness: MySize.getHeight(1)),
            ),
            ListTile(
              title: Text(
                "Get in Touch",
                style: TextStyle(fontSize: MySize.getHeight(14)),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: MySize.getHeight(16)),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.GET_IN_TOUCH_SCREEN);
              },
            ),
            SizedBox(
              height: MySize.getHeight(5),
              child: Divider(thickness: MySize.getHeight(1)),
            ),
            ListTile(
              title: Text(
                "About Us",
                style: TextStyle(fontSize: MySize.getHeight(14)),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: MySize.getHeight(16)),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.ABOUT_US_SCREEN);
              },
            ),
            SizedBox(
              height: MySize.getHeight(5),
              child: Divider(thickness: MySize.getHeight(1)),
            ),
            ListTile(
              title: Text(
                (!isNullEmptyOrFalse(box.read(ArgumentConstant.token)))
                    ? "Logout"
                    : "Login",
                style: TextStyle(fontSize: MySize.getHeight(14)),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: MySize.getHeight(16)),
              onTap: () {
                if (!isNullEmptyOrFalse(box.read(ArgumentConstant.token))) {
                  getLogOut();
                } else {
                  Get.back();
                  Get.toNamed(Routes.LOGIN_SCREEN);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
