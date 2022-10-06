import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizeConstant.dart';
import '../../../utilities/buttons.dart';
import '../controllers/blogs_screen_controller.dart';

class BlogsScreenView extends GetWidget<BlogsScreenController> {
  const BlogsScreenView({Key? key}) : super(key: key);
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
            'BLOGS',
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
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: MySize.getWidth(7),
            childAspectRatio: MySize.getHeight(0.54),
            mainAxisSpacing: MySize.getHeight(8),
            padding: EdgeInsets.only(top: MySize.getHeight(10)),
            children: List.generate(20, (index) {
              return Card(
                child: Container(
                  color: Colors.grey.shade50,
                  width: MySize.getWidth(180),
                  padding: EdgeInsets.symmetric(
                      horizontal: MySize.getWidth(8),
                      vertical: MySize.getHeight(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(MySize.getHeight(5)),
                          child: Container(
                            height: MySize.getHeight(120),
                            width: MySize.screenWidth,
                            alignment: Alignment.center,
                            child: getImageByLink(
                              url: "",
                              boxFit: BoxFit.cover,
                              height: MySize.getHeight(120),
                              width: MySize.screenWidth,
                            ),
                          ),
                        ),
                      ),
                      Spacing.height(10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "By : Admin / 25 Aug, 22",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: MySize.getHeight(10)),
                        ),
                      ),
                      Spacing.height(10),
                      Text(
                        "Budget friendly dog breeds - Price of Indian Spitz and Pomeranian",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MySize.getHeight(15)),
                      ),
                      Spacing.height(10),
                      Text(
                        "Selecting a breed of dog in general should not be a matter of affordability. It ...",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: MySize.getHeight(10)),
                      ),
                      Spacing.height(10),
                      getButton(
                        title: "READ MORE",
                        height: 32,
                        width: 100,
                        textSize: 11,
                        borderRadius: 5,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
