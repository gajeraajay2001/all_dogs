import 'package:all_dogs/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/api_constants.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../utilities/buttons.dart';
import '../controllers/home_screen_controller.dart';

class HomeLatestBlogWidget extends StatefulWidget {
  HomeLatestBlogWidget({required this.homeScreenController});
  HomeScreenController homeScreenController = HomeScreenController();

  @override
  State<HomeLatestBlogWidget> createState() => _HomeLatestBlogWidgetState();
}

class _HomeLatestBlogWidgetState extends State<HomeLatestBlogWidget> {
  HomeScreenController controller = HomeScreenController();
  @override
  void initState() {
    controller = widget.homeScreenController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              "LATEST BLOG",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: MySize.getHeight(18)),
            ),
          ),
          Center(
            child: SizedBox(
                height: MySize.getHeight(10),
                width: MySize.getWidth(100),
                child: Divider(
                  color: appTheme.primaryTheme,
                )),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.BLOGS_SCREEN);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View All",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    Spacing.width(3),
                    Icon(Icons.arrow_forward,
                        color: Colors.grey.shade500,
                        size: MySize.getHeight(15)),
                    Spacing.width(10),
                  ],
                ),
              )),
          Spacing.height(5),
          if (!isNullEmptyOrFalse(controller.blogList))
            SizedBox(
              width: MySize.screenWidth,
              height: MySize.getHeight(310),
              child: ListView.separated(
                itemCount: controller.blogList.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
                itemBuilder: (context, index) {
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
                                  url: imageBaseUrl +
                                      controller.blogList[index].pic.toString(),
                                  boxFit: BoxFit.cover,
                                  height: MySize.getHeight(120),
                                  width: MySize.screenWidth,
                                ),
                              ),
                            ),
                          ),
                          Spacing.height(10),
                          if (!isNullEmptyOrFalse(
                              controller.blogList[index].dateTimePostedAt))
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "By : Admin / ${DateFormat("dd MMM, yy").format(controller.blogList[index].dateTimePostedAt!)}",
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: MySize.getHeight(10)),
                              ),
                            ),
                          Spacing.height(10),
                          SizedBox(
                            height: MySize.getHeight(40),
                            child: Text(
                              controller.blogList[index].title.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MySize.getHeight(15)),
                            ),
                          ),
                          Spacing.height(10),
                          SizedBox(
                            height: MySize.getHeight(30),
                            child: Text(
                              controller.blogList[index].body.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: MySize.getHeight(12)),
                            ),
                          ),
                          Spacing.height(20),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.BLOG_DETAILS_SCREEN,
                                  arguments: {
                                    ArgumentConstant.postId:
                                        controller.blogList[index].id
                                  });
                            },
                            child: getButton(
                              title: "MORE DETAILS",
                              height: 35,
                              width: 125,
                              textSize: 12,
                              borderRadius: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: MySize.getWidth(10),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
