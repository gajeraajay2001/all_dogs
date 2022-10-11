import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/api_constants.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/buttons.dart';
import '../../../utilities/text_field.dart';
import '../controllers/puppies_list_controller.dart';

class PuppiesListView extends GetWidget<PuppiesListController> {
  const PuppiesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
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
            'Puppies',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.height(8),
              Text(
                'Pups Available',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: MySize.getHeight(20)),
              ),
              Spacing.height(12),
              getTextField(
                hintText: "Search...",
                isFilled: true,
                onChange: (val) {
                  if (val.length >= 3) {
                    controller.getPuppiesList(
                        context: context,
                        isFromSearch: true,
                        search: val.toLowerCase());
                  } else if (val.trim().length == 0) {
                    controller.getPuppiesList(
                      context: context,
                      isFromSearch: true,
                    );
                  }
                },
                borderColor: Colors.transparent,
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              Spacing.height(8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Min. 3 Characters",
                  style: TextStyle(
                      fontSize: MySize.getHeight(11), color: Colors.grey),
                ),
              ),
              Spacing.height(8),
              (controller.hasData.isFalse)
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                            color: appTheme.primaryTheme),
                      ),
                    )
                  : Expanded(
                      child: (controller.puppiesList.isEmpty)
                          ? Center(
                              child: Text("No Puppies Found"),
                            )
                          : SingleChildScrollView(
                              controller: controller.controller,
                              child: Column(
                                children: [
                                  GridView.count(
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    // controller: controller.controller,
                                    crossAxisSpacing: MySize.getWidth(10),
                                    childAspectRatio: MySize.getHeight(0.39),
                                    mainAxisSpacing: MySize.getHeight(10),
                                    padding: EdgeInsets.only(
                                        top: MySize.getHeight(10)),
                                    children: List.generate(
                                        controller.puppiesList.length, (i) {
                                      return Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MySize.getHeight(5))),
                                        child: Container(
                                          width: MySize.getWidth(180),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MySize.getHeight(5))),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MySize.getWidth(8),
                                              vertical: MySize.getHeight(5)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: MySize.getHeight(140),
                                                width: MySize.getWidth(200),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              MySize.getHeight(
                                                                  5)),
                                                      child: Container(
                                                        height:
                                                            MySize.getHeight(
                                                                120),
                                                        width:
                                                            MySize.screenWidth,
                                                        alignment:
                                                            Alignment.center,
                                                        child: getImageByLink(
                                                          url: imageBaseUrl +
                                                              controller
                                                                  .puppiesList[
                                                                      i]
                                                                  .pic1
                                                                  .toString(),
                                                          boxFit: BoxFit.cover,
                                                          height:
                                                              MySize.getHeight(
                                                                  120),
                                                          width: MySize
                                                              .screenWidth,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 0,
                                                      left: MySize.getWidth(10),
                                                      child: Container(
                                                        height:
                                                            MySize.getHeight(
                                                                52),
                                                        width:
                                                            MySize.getWidth(37),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: appTheme
                                                              .primaryTheme,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(MySize
                                                                      .getHeight(
                                                                          3)),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: MySize
                                                                    .getHeight(
                                                                        5),
                                                                horizontal: MySize
                                                                    .getWidth(
                                                                        5)),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              DateFormat("MMM")
                                                                  .format(controller
                                                                      .puppiesList[
                                                                          i]
                                                                      .dateTimeDOB!),
                                                              // 'Aug',

                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: MySize
                                                                      .getHeight(
                                                                          12),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            Spacing.height(5),
                                                            Text(
                                                              controller
                                                                  .puppiesList[
                                                                      i]
                                                                  .dateTimeDOB!
                                                                  .day
                                                                  .toString(),
                                                              // "25",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: MySize
                                                                      .getHeight(
                                                                          12),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
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
                                                  controller
                                                      .puppiesList[i].title
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          MySize.getHeight(15)),
                                                ),
                                              ),
                                              Spacing.height(10),
                                              SizedBox(
                                                height: MySize.getHeight(35),
                                                child: Text(
                                                  controller.puppiesList[i].body
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize:
                                                          MySize.getHeight(12)),
                                                ),
                                              ),
                                              Spacing.height(15),
                                              Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    if (!isNullEmptyOrFalse(
                                                        controller
                                                            .puppiesList[i]
                                                            .postId)) {
                                                      Get.toNamed(
                                                          Routes
                                                              .PUPPIES_DETAILS_SCREEN,
                                                          arguments: {
                                                            ArgumentConstant
                                                                    .postId:
                                                                controller
                                                                    .puppiesList[
                                                                        i]
                                                                    .postId,
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
                                                    color:
                                                        appTheme.primaryTheme,
                                                    size: MySize.getHeight(20),
                                                  ),
                                                  Spacing.width(5),
                                                  Text(
                                                    "Posted by",
                                                    style: TextStyle(
                                                        fontSize:
                                                            MySize.getHeight(
                                                                11)),
                                                  ),
                                                  // Spacer(),
                                                  Space.width(10),
                                                  Expanded(
                                                    // width: MySize.getWidth(80),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        controller
                                                            .puppiesList[i].name
                                                            .toString(),

                                                        // "Riya",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: MySize
                                                                .getHeight(11)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  Space.height(10),
                                  (controller.allDataLoaded.isTrue)
                                      ? Text("All Data loaded")
                                      : Center(
                                          child: CircularProgressIndicator(
                                              color: appTheme.primaryTheme),
                                        ),
                                  Space.height(10),
                                ],
                              ),
                            ),
                    )
            ],
          ),
        ),
      );
    });
  }
}
