import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/utilities/buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/breeds_screen_controller.dart';

class BreedsScreenView extends GetWidget<BreedsScreenController> {
  const BreedsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Breeds',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.black),
            ),
          ],
          centerTitle: true,
        ),
        body: Container(
          child: ListView.separated(
              padding: EdgeInsets.symmetric(
                  horizontal: MySize.getWidth(15),
                  vertical: MySize.getHeight(20)),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Container(
                    height: MySize.getHeight(210),
                    width: MySize.screenWidth,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding: EdgeInsets.only(
                              top: MySize.getHeight(20),
                              left: MySize.getWidth(10),
                              right: MySize.getWidth(5),
                              bottom: MySize.getHeight(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "By : Admin / 20 Feb, 22",
                                  style: TextStyle(
                                      fontSize: MySize.getHeight(9),
                                      color: Colors.grey.shade600),
                                ),
                                Spacing.height(15),
                                Text(
                                  "Pomeranian",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: MySize.getHeight(16),
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacing.height(15),
                                Text(
                                  "Pomeranian or Indian Spitz, are tiny dogs with big attitudes. Their vivacious pe...",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: MySize.getHeight(12),
                                      color: Colors.black87),
                                ),
                                Spacing.height(40),
                                Center(
                                  child: getButton(
                                      title: 'READ MORE',
                                      height: 30,
                                      width: 100,
                                      textSize: 11),
                                ),
                                Spacing.height(5),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(MySize.getHeight(7)),
                            child: Container(
                              height: MySize.getHeight(220),
                              child: getImageByLink(
                                url: "",
                                boxFit: BoxFit.cover,
                                height: 200,
                                width: 68,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: MySize.getHeight(20),
                );
              },
              itemCount: 100),
        ),
      ),
    );
  }
}
