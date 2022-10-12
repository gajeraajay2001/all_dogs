import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';

import '../../../constants/sizeConstant.dart';
import '../../../utilities/buttons.dart';
import '../controllers/breeds_details_screen_controller.dart';

class BreedsDetailsScreenView extends GetWidget<BreedsDetailsScreenController> {
  const BreedsDetailsScreenView({Key? key}) : super(key: key);

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
                            // if (!isNullEmptyOrFalse(
                            //     box.read(ArgumentConstant.token))) {
                            //   controller.isScrollerJumpToLast.value = false;
                            //   controller.getCommentssData(
                            //       context: context, id: controller.postId);
                            //   getBottomSheetWidget(
                            //       context: context,
                            //       detailsScreenController: controller);
                            // } else {
                            //   Get.toNamed(Routes.LOGIN_SCREEN);
                            // }
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
}
//9879207604
