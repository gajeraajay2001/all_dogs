import 'package:all_dogs/app/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../controllers/video_screen_controller.dart';

class VideoScreenView extends GetWidget<VideoScreenController> {
  const VideoScreenView({Key? key}) : super(key: key);

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
              'VIDEOS',
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
              : (controller.videoList.isEmpty)
                  ? Container(
                      width: MySize.screenWidth,
                      // height: MySize.getHeight(100),
                      alignment: Alignment.center,
                      child: Text(
                        "No blogs found...",
                        style: TextStyle(fontSize: MySize.getHeight(18)),
                      ),
                    )
                  : SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        children: [
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisSpacing: MySize.getWidth(7),
                            childAspectRatio:
                                MySize.getHeight((MySize.isMini) ? 0.68 : 0.70),
                            mainAxisSpacing: MySize.getHeight(8),
                            padding: EdgeInsets.only(top: MySize.getHeight(10)),
                            children:
                                List.generate(controller.videoList.length, (i) {
                              return Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        MySize.getHeight(5))),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      borderRadius: BorderRadius.circular(
                                          MySize.getHeight(5))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: InkWell(
                                          onTap: () {
                                            controller.youtubePlayerController =
                                                YoutubePlayerController(
                                              initialVideoId: controller
                                                  .videoList[i].videoUrl!
                                                  .split(
                                                      "https://www.youtube.com/embed/")[1],
                                            );
                                            showYoutubeDialog(context: context);
                                          },
                                          child: Container(
                                            height: MySize.getHeight(120),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                getImageByLink(
                                                    url: getYoutubeThumbnail(
                                                        videoId: controller
                                                                .videoList[i]
                                                                .videoUrl!
                                                                .split(
                                                                    "https://www.youtube.com/embed/")[
                                                            1]),
                                                    height:
                                                        MySize.getHeight(120),
                                                    width: MySize.screenWidth),
                                                Image.asset(
                                                  imagePath +
                                                      "youtube_icon.png",
                                                  height: MySize.getHeight(65),
                                                  width: MySize.getWidth(65),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacing.height(10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MySize.getWidth(8)),
                                        child: SizedBox(
                                          height: MySize.getHeight(70),
                                          child: Text(
                                            controller.videoList[i].title
                                                .toString(),
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: MySize.getHeight(14)),
                                          ),
                                        ),
                                      ),
                                      Spacing.height(7),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MySize.getWidth(8)),
                                        child: SizedBox(
                                          height: MySize.getHeight(20),
                                          child: Text(
                                            DateFormat("dd MMM, yy").format(
                                                controller.videoList[i]
                                                    .dateTimeCreatedAt!),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: MySize.getHeight(12)),
                                          ),
                                        ),
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
        );
      }),
    );
  }

  showYoutubeDialog({required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: controller.youtubePlayerController!,
                showVideoProgressIndicator: true,
              ),
              builder: (context, player) {
                return Container(
                  child: player,
                );
              });
        });
  }
}
