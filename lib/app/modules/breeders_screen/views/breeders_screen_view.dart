import 'package:all_dogs/app/utilities/text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/api_constants.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../controllers/breeders_screen_controller.dart';

class BreedersScreenView extends GetWidget<BreedersScreenController> {
  const BreedersScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
              'Breeders',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
            child: Column(
              children: [
                Spacing.height(10),
                getTextField(
                  hintText: "Search...",
                  isFilled: true,
                  onChange: (val) {
                    if (val.length >= 3) {
                      controller.getBreederLstData(
                          context: context,
                          isFromSearch: true,
                          search: val.toLowerCase());
                    } else if (val.trim().length == 0) {
                      controller.getBreederLstData(
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
                        child: (controller.breederList.isEmpty)
                            ? Center(
                                child: Text("No breeders Found"),
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
                                      childAspectRatio: MySize.getHeight(0.75),
                                      mainAxisSpacing: MySize.getHeight(10),
                                      padding: EdgeInsets.only(
                                          top: MySize.getHeight(10)),
                                      children: List.generate(
                                          controller.breederList.length, (i) {
                                        return Card(
                                          elevation: 6,
                                          child: Container(
                                            height: MySize.getHeight(300),
                                            child: Column(
                                              children: [
                                                Spacing.height(10),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          200),
                                                  child: Container(
                                                    height:
                                                        MySize.getHeight(68),
                                                    width: MySize.getWidth(68),
                                                    child: getImageByLink(
                                                        url: !isNullEmptyOrFalse(
                                                                controller
                                                                    .breederList[
                                                                        i]
                                                                    .pic)
                                                            ? (imageBaseUrl +
                                                                controller
                                                                    .breederList[
                                                                        i]
                                                                    .pic
                                                                    .toString())
                                                            : "",
                                                        height: 68,
                                                        width: 68,
                                                        imagePlaceHolder:
                                                            "avatar_placeholder.png"),
                                                  ),
                                                ),
                                                Spacing.height(15),
                                                Text(
                                                  controller.breederList[i].name
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Spacing.height(15),
                                                Flexible(
                                                  child: Text(
                                                    controller
                                                        .breederList[i].email
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize:
                                                            MySize.getHeight(
                                                                9)),
                                                  ),
                                                ),
                                                Spacing.height(15),
                                                Text(
                                                  controller
                                                      .breederList[i].mobile
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize:
                                                          MySize.getHeight(9)),
                                                ),
                                                Spacing.height(15),
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
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
