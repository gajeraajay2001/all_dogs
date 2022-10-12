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
