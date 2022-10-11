import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';

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
            leading: Icon(Icons.arrow_back, color: Colors.black),
            elevation: 0,
          ),
          body: (controller.hasData.isFalse)
              ? Center(
                  child:
                      CircularProgressIndicator(color: appTheme.primaryTheme),
                )
              : Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: NestedScrollView(
                            headerSliverBuilder: (context, bool) {
                              return [
                                SizedBox(
                                  height: MySize.getHeight(200),
                                  child: InAppWebView(
                                    onScrollChanged: (val, a, b) {},
                                    initialUrlRequest: URLRequest(
                                      url: Uri.parse(controller.url),
                                    ),
                                    onOverScrolled: (val, a, b, c, d) {
                                      print("Scrool : = ${val} , $a,$b,$c,$d");
                                    },
                                    onReceivedServerTrustAuthRequest:
                                        (InAppWebViewController controller,
                                            URLAuthenticationChallenge
                                                challenge) async {
                                      return await ServerTrustAuthResponse(
                                          action: ServerTrustAuthResponseAction
                                              .PROCEED);
                                    },
                                  ),
                                ),
                              ];
                            },
                            body: Text("hsbcddshcjbdhsbchjbdschmbdschbdshjbc")),
                      ),
                      // Expanded(
                      //   child:
                      // ),
                      // Text("testing"),
                    ],
                  ),
                ),
        );
      }),
    );
  }
}
