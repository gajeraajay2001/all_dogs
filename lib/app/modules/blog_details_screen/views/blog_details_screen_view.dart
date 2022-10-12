import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/utilities/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/buttons.dart';
import '../controllers/blog_details_screen_controller.dart';

class BlogDetailsScreenView extends GetWidget<BlogDetailsScreenController> {
  const BlogDetailsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back, color: Colors.black)),
            elevation: 0,
            title: Text(
              controller.title.value,
              style: TextStyle(
                  color: Colors.black, fontSize: MySize.getHeight(17)),
            ),
          ),
          body: (controller.hasData.isFalse)
              ? Center(
                  child:
                      CircularProgressIndicator(color: appTheme.primaryTheme),
                )
              : Container(
                  height: MySize.screenHeight,
                  width: MySize.screenWidth,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      InAppWebView(
                        onScrollChanged: (val, a, b) {},
                        initialUrlRequest: URLRequest(
                          url: Uri.parse(controller.url),
                        ),
                        onOverScrolled: (val, a, b, c, d) {
                          print("Scrool : = ${val} , $a,$b,$c,$d");
                        },
                        onReceivedServerTrustAuthRequest:
                            (InAppWebViewController controller,
                                URLAuthenticationChallenge challenge) async {
                          return await ServerTrustAuthResponse(
                              action: ServerTrustAuthResponseAction.PROCEED);
                        },
                      ),
                      Positioned(
                        bottom: MySize.getHeight(10),
                        child: InkWell(
                          onTap: () {
                            if (!isNullEmptyOrFalse(
                                box.read(ArgumentConstant.token))) {
                              controller.isScrollerJumpToLast.value = false;
                              controller.getCommentssData(
                                  context: context, id: controller.postId);
                              getBottomSheetWidget(
                                  context: context,
                                  detailsScreenController: controller);
                            } else {
                              Get.toNamed(Routes.LOGIN_SCREEN);
                            }
                          },
                          child: Container(
                            child: getButton(
                                width: MySize.getWidth(280), title: "COMMENT"),
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

  getBottomSheetWidget(
      {required BuildContext context,
      required BlogDetailsScreenController detailsScreenController}) {
    controller.commentController.clear();

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              MySize.getHeight(10),
            ),
            topRight: Radius.circular(
              MySize.getHeight(10),
            ),
          ),
        ),
        builder: (context) {
          return Obx(() {
            return Container(
                padding: EdgeInsets.only(
                    left: MySize.getWidth(10),
                    right: MySize.getWidth(10),
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    top: MySize.getHeight(10)),
                margin: EdgeInsets.only(top: MySize.getHeight(200)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      MySize.getHeight(10),
                    ),
                    topRight: Radius.circular(
                      MySize.getHeight(10),
                    ),
                  ),
                  color: Colors.white,
                ),
                child: (controller.hasCommentData.isFalse)
                    ? Center(
                        child: CircularProgressIndicator(
                            color: appTheme.primaryTheme),
                      )
                    : SingleChildScrollView(
                        controller: controller.scrollController,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((timeStamp) {
                                    if (controller
                                        .isScrollerJumpToLast.isFalse) {
                                      controller.scrollController.jumpTo(
                                          controller.scrollController.position
                                              .maxScrollExtent);
                                      controller.isScrollerJumpToLast.value =
                                          true;
                                    }
                                  });
                                  return ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          MySize.getHeight(100000)),
                                      child: Container(
                                        height: MySize.getHeight(35),
                                        width: MySize.getWidth(35),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: getImageByLink(
                                            url: imageBaseUrl +
                                                controller
                                                    .commentList[index].pic
                                                    .toString(),
                                            boxFit: BoxFit.cover,
                                            height: 35,
                                            width: 35),
                                      ),
                                    ),
                                    title: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MySize.getHeight(5)),
                                      child: Container(
                                        width: MySize.getWidth(300),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                controller
                                                    .commentList[index].name
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize:
                                                        MySize.getHeight(13)),
                                              ),
                                            ),
                                            Container(
                                              height: MySize.getHeight(5),
                                              width: MySize.getWidth(5),
                                              margin: EdgeInsets.only(
                                                  left: MySize.getWidth(5),
                                                  right: MySize.getWidth(5)),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Text(
                                              DateFormat("dd MMM,yy hh:mm a")
                                                  .format(controller
                                                      .commentList[index]
                                                      .dateTimePostedAt!),
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize:
                                                      MySize.getHeight(10)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    subtitle: Text(controller
                                        .commentList[index].comment
                                        .toString()),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox();
                                },
                                itemCount: controller.commentList.length),
                            Spacing.height(10),
                            Form(
                              key: controller.formKey,
                              child: Container(
                                child: getTextField(
                                    textEditingController:
                                        controller.commentController,
                                    hintText: "write your comment here...",
                                    textInputAction: TextInputAction.newline,
                                    maxLine: 4,
                                    validation: (val) {
                                      if (isNullEmptyOrFalse(
                                          val.toString().trim())) {
                                        return "Please enter comment";
                                      }
                                      return null;
                                    }),
                              ),
                            ),
                            Spacing.height(10),
                            InkWell(
                              onTap: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  FocusScope.of(context).unfocus();
                                  controller.commentApi(
                                      context: context,
                                      id: controller.postId,
                                      comment:
                                          controller.commentController.text);
                                }
                              },
                              child: Container(
                                width: MySize.getWidth(280),
                                margin: EdgeInsets.only(
                                    bottom: MySize.getHeight(10)),
                                child: getButton(
                                  title: "COMMENT",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
          });
        });
  }
}
