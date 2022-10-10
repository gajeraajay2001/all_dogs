import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:all_dogs/app/routes/app_pages.dart';
import 'package:all_dogs/app/utilities/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeNewArrivalWidget extends StatefulWidget {
  HomeNewArrivalWidget({required this.homeScreenController});
  HomeScreenController homeScreenController = HomeScreenController();

  @override
  State<HomeNewArrivalWidget> createState() => _HomeNewArrivalWidgetState();
}

class _HomeNewArrivalWidgetState extends State<HomeNewArrivalWidget> {
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
              "NEW ARRIVALS",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: MySize.getHeight(18)),
            ),
          ),
          Center(
            child: SizedBox(
                height: MySize.getHeight(10),
                width: MySize.getWidth(100),
                child: Divider(
                  color: appTheme.secondaryTheme,
                )),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  Spacing.width(3),
                  Icon(Icons.arrow_forward,
                      color: Colors.grey.shade500, size: MySize.getHeight(15)),
                  Spacing.width(10),
                ],
              )),
          Spacing.height(5),
          if (!isNullEmptyOrFalse(controller.postList))
            SizedBox(
              width: MySize.screenWidth,
              height: MySize.getHeight(335),
              child: ListView.separated(
                itemCount: controller.postList.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(MySize.getHeight(5))),
                    child: Container(
                      width: MySize.getWidth(180),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius:
                              BorderRadius.circular(MySize.getHeight(5))),
                      padding: EdgeInsets.symmetric(
                          horizontal: MySize.getWidth(8),
                          vertical: MySize.getHeight(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MySize.getHeight(140),
                            width: MySize.getWidth(200),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MySize.getHeight(5)),
                                  child: Container(
                                    height: MySize.getHeight(120),
                                    width: MySize.screenWidth,
                                    alignment: Alignment.center,
                                    child: getImageByLink(
                                      url: imageBaseUrl +
                                          controller.postList[index].pic1
                                              .toString(),
                                      boxFit: BoxFit.cover,
                                      height: MySize.getHeight(120),
                                      width: MySize.screenWidth,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: MySize.getWidth(10),
                                  child: Container(
                                    height: MySize.getHeight(52),
                                    width: MySize.getWidth(37),
                                    decoration: BoxDecoration(
                                      color: appTheme.secondaryTheme,
                                      borderRadius: BorderRadius.circular(
                                          MySize.getHeight(3)),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: MySize.getHeight(5),
                                        horizontal: MySize.getWidth(5)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          DateFormat("MMM").format(controller
                                              .postList[index].dateTimeDOB!),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MySize.getHeight(12),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Spacing.height(5),
                                        Text(
                                          controller
                                              .postList[index].dateTimeDOB!.day
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MySize.getHeight(12),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacing.height(10),
                          SizedBox(
                            height: MySize.getHeight(40),
                            child: Text(
                              controller.postList[index].title.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MySize.getHeight(15)),
                            ),
                          ),
                          Spacing.height(10),
                          SizedBox(
                            height: MySize.getHeight(35),
                            child: Text(
                              controller.postList[index].body.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: MySize.getHeight(12)),
                            ),
                          ),
                          Spacing.height(15),
                          Center(
                            child: InkWell(
                              onTap: () {
                                if (!isNullEmptyOrFalse(
                                    controller.postList[index].postId)) {
                                  Get.toNamed(Routes.PUPPIES_DETAILS_SCREEN,
                                      arguments: {
                                        ArgumentConstant.postId:
                                            controller.postList[index].postId,
                                      });
                                }
                              },
                              child: getButton(
                                title: "MORE DETAILS",
                                height: 35,
                                width: 125,
                                textSize: 12,
                                borderRadius: 5,
                              ),
                            ),
                          ),
                          Spacing.height(10),
                          Row(
                            children: [
                              Icon(
                                Icons.person_outline,
                                color: appTheme.secondaryTheme,
                                size: MySize.getHeight(20),
                              ),
                              Spacing.width(10),
                              Text(
                                "Posted by",
                                style:
                                    TextStyle(fontSize: MySize.getHeight(11)),
                              ),
                              Spacer(),
                              SizedBox(
                                width: MySize.getWidth(80),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    controller.postList[index].name.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MySize.getHeight(11)),
                                  ),
                                ),
                              ),
                            ],
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
