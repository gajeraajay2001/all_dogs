import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/utilities/buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/color_constant.dart';
import '../../../utilities/text_field.dart';
import '../controllers/breeds_screen_controller.dart';

class BreedsScreenView extends GetWidget<BreedsScreenController> {
  const BreedsScreenView({Key? key}) : super(key: key);

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
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text(
              'Breeds',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  controller.showSearch.toggle();
                },
                icon: Icon(Icons.search, color: Colors.black),
              ),
            ],
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              children: [
                if (controller.showSearch.isTrue)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MySize.getWidth(15),
                    ),
                    child: getTextField(
                      hintText: "Search...",
                      isFilled: true,
                      onChange: (val) {
                        if (val.length >= 3) {
                          controller.getBreedsLstData(
                              context: context,
                              isFromSearch: true,
                              search: val.toLowerCase());
                        } else if (val.trim().length == 0) {
                          controller.getBreedsLstData(
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
                  ),
                Expanded(
                  child: (controller.hasData.value)
                      ? (controller.breederList.isEmpty)
                          ? Center(
                              child: Text("No breeds Found"),
                            )
                          : ListView.separated(
                              controller: controller.controller,
                              padding: EdgeInsets.symmetric(
                                  horizontal: MySize.getWidth(15),
                                  vertical: MySize.getHeight(20)),
                              itemBuilder: (context, index) {
                                if (index == controller.breederList.length) {
                                  if (controller.allDataLoaded.isFalse) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                          color: appTheme.primaryTheme),
                                    );
                                  }
                                  return Center(child: Text("All Data loaded"));
                                }
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "By : Admin / ${DateFormat("dd MMM,yy").format(getDateFromStringNew(controller.breederList[index].postedAt!, formatter: 'yyyy-MM-dd hh:mm:ss'))}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MySize.getHeight(9),
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                                Spacing.height(15),
                                                Text(
                                                  controller
                                                      .breederList[index].title
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize:
                                                          MySize.getHeight(16),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Spacing.height(15),
                                                Text(
                                                  controller
                                                      .breederList[index].body
                                                      .toString(),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize:
                                                          MySize.getHeight(12),
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
                                            borderRadius: BorderRadius.circular(
                                                MySize.getHeight(7)),
                                            child: Container(
                                              height: MySize.getHeight(220),
                                              child: getImageByLink(
                                                url: !isNullEmptyOrFalse(
                                                        controller
                                                            .breederList[index]
                                                            .pic
                                                            .toString())
                                                    ? imageBaseUrl +
                                                        controller
                                                            .breederList[index]
                                                            .pic
                                                            .toString()
                                                    : "",
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
                              itemCount: controller.breederList.length + 1)
                      : Center(
                          child: CircularProgressIndicator(
                              color: appTheme.primaryTheme),
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
