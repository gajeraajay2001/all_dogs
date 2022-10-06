import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        padding: EdgeInsets.only(left: MySize.getWidth(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacing.height(50),
            ListTile(
              title: Text(
                "Breeders",
                style: TextStyle(fontSize: MySize.getHeight(16)),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.BREEDERS_SCREEN);
              },
            ),
            ListTile(
              title: Text(
                "Breeds",
                style: TextStyle(fontSize: MySize.getHeight(16)),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.BREEDS_SCREEN);
              },
            ),
            ListTile(
              title: Text(
                "Blogs",
                style: TextStyle(fontSize: MySize.getHeight(16)),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.BLOGS_SCREEN);
              },
            ),
          ],
        ),
      ),
    );
  }
}
