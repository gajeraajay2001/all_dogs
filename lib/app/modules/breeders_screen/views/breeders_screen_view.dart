import 'package:all_dogs/app/routes/app_pages.dart';
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
            padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(10)),
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
                                      crossAxisSpacing: MySize.getWidth(10),
                                      childAspectRatio: MySize.getHeight(
                                          (MySize.isMini) ? 1.05 : 0.80),
                                      mainAxisSpacing: MySize.getHeight(10),
                                      padding: EdgeInsets.only(
                                          top: MySize.getHeight(10)),
                                      children: List.generate(
                                          controller.breederList.length, (i) {
                                        return InkWell(
                                          onTap: () {
                                            Get.toNamed(Routes.PUPPIES_LIST,
                                                arguments: {
                                                  ArgumentConstant.breederName:
                                                      controller
                                                          .breederList[i].name,
                                                  ArgumentConstant.breederId:
                                                      controller
                                                          .breederList[i].id,
                                                  ArgumentConstant
                                                      .isFromBreeder: true,
                                                });
                                          },
                                          child: Card(
                                            elevation: 4,
                                            child: Container(
                                              height: MySize.getHeight(300),
                                              child: Column(
                                                children: [
                                                  Spacing.height(10),
                                                  CircleAvatar(
                                                    radius:
                                                        MySize.getHeight(34),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100000),
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
                                                          boxFit: BoxFit.cover,
                                                          imagePlaceHolder:
                                                              "avatar_placeholder.png"),
                                                    ),
                                                  ),
                                                  Spacing.height(15),
                                                  Text(
                                                    controller
                                                        .breederList[i].name
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
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize:
                                                              MySize.getHeight(
                                                                  11)),
                                                    ),
                                                  ),
                                                  Spacing.height(10),
                                                  Text(
                                                    controller
                                                        .breederList[i].mobile
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize:
                                                            MySize.getHeight(
                                                                10)),
                                                  ),
                                                  Spacing.height(10),
                                                ],
                                              ),
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
