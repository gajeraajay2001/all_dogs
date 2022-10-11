import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';

class HomeAddPostWidget extends StatefulWidget {
  const HomeAddPostWidget({Key? key}) : super(key: key);

  @override
  State<HomeAddPostWidget> createState() => _HomeAddPostWidgetState();
}

class _HomeAddPostWidgetState extends State<HomeAddPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(15)),
            child: Row(
              children: [
                Text(
                  "Pups Available",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MySize.getHeight(20)),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      if (isNullEmptyOrFalse(
                          box.read(ArgumentConstant.token))) {
                        Get.toNamed(Routes.LOGIN_SCREEN);
                      } else {
                        Get.toNamed(Routes.CREATE_ADD);
                      }
                    },
                    child: SvgPicture.asset(imagePath + "edit_icon.svg")),
              ],
            ),
          ),
          Spacing.height(10),
          Image.asset(
            imagePath + "poster_01.png",
            fit: BoxFit.cover,
            width: MySize.screenWidth,
          ),
        ],
      ),
    );
  }
}
