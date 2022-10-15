import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../constants/sizeConstant.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/buttons.dart';
import '../../../utilities/text_field.dart';
import '../controllers/blogs_screen_controller.dart';

class BlogsScreenView extends GetWidget<BlogsScreenController> {
  const BlogsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                print(MediaQuery.of(context).size.height);
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text(
              'BLOGS',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: (controller.hasData.isFalse)
              ? Center(
                  child:
                      CircularProgressIndicator(color: appTheme.primaryTheme),
                )
              : (controller.blogList.isEmpty)
                  ? Container(
                      width: MySize.screenWidth,
                      // height: MySize.getHeight(100),
                      alignment: Alignment.center,
                      child: Text(
                        "No blogs found...",
                        style: TextStyle(fontSize: MySize.getHeight(18)),
                      ),
                    )
                  : Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: SmartRefresher(
                              controller: controller.refreshController,
                              enablePullUp: !controller.loadCompleted.value,
                              enablePullDown: false,
                              onLoading: () {
                                controller.page.value++;
                                controller.getBlogLists(
                                    context: context, isForLoading: true);
                              },
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: MySize.getWidth(7),
                                childAspectRatio: MySize.getHeight(
                                    (MySize.isMini) ? 0.75 : 0.56),
                                mainAxisSpacing: MySize.getHeight(8),
                                padding:
                                    EdgeInsets.only(top: MySize.getHeight(10)),
                                children: List.generate(
                                    controller.blogList.length, (index) {
                                  return Card(
                                    child: Container(
                                      color: Colors.grey.shade50,
                                      width: MySize.getWidth(180),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      MySize.getHeight(5)),
                                                  topRight: Radius.circular(
                                                      MySize.getHeight(5))),
                                              child: Container(
                                                height: MySize.getHeight(120),
                                                width: MySize.screenWidth,
                                                child: getImageByLink(
                                                  url: imageBaseUrl +
                                                      controller
                                                          .blogList[index].pic
                                                          .toString(),
                                                  boxFit: BoxFit.cover,
                                                  height: MySize.getHeight(120),
                                                  width: MySize.screenWidth,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacing.height(10),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: MySize.getWidth(8)),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "By : Admin / ${DateFormat("dd MMM, yy").format(controller.blogList[index].dateTimePostedAt!)}",
                                                style: TextStyle(
                                                    color: Colors.grey.shade600,
                                                    fontSize:
                                                        MySize.getHeight(10)),
                                              ),
                                            ),
                                          ),
                                          Spacing.height(5),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: MySize.getWidth(8)),
                                            child: SizedBox(
                                              height: MySize.getHeight(37),
                                              child: Text(
                                                controller.blogList[index].title
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        MySize.getHeight(14)),
                                              ),
                                            ),
                                          ),
                                          Spacing.height(10),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: MySize.getWidth(8)),
                                            child: SizedBox(
                                              height: MySize.getHeight(30),
                                              child: Text(
                                                controller.blogList[index].body
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize:
                                                        MySize.getHeight(10)),
                                              ),
                                            ),
                                          ),
                                          Spacing.height(10),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  Routes.BLOG_DETAILS_SCREEN,
                                                  arguments: {
                                                    ArgumentConstant.postId:
                                                        controller
                                                            .blogList[index].id
                                                  });
                                            },
                                            child: getButton(
                                              title: "READ MORE",
                                              height: 30,
                                              width: 100,
                                              textSize: 11,
                                              borderRadius: 5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
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
