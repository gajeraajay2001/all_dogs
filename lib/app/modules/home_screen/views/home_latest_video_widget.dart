import 'package:all_dogs/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../constants/api_constants.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../routes/app_pages.dart';

class HomeLatestVideoWidget extends StatefulWidget {
  HomeLatestVideoWidget({required this.homeScreenController});
  HomeScreenController homeScreenController = HomeScreenController();
  @override
  State<HomeLatestVideoWidget> createState() => _HomeLatestVideoWidgetState();
}

class _HomeLatestVideoWidgetState extends State<HomeLatestVideoWidget> {
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
              "LATEST VIDEOS",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: MySize.getHeight(18)),
            ),
          ),
          Center(
            child: SizedBox(
                height: MySize.getHeight(10),
                width: MySize.getWidth(100),
                child: Divider(
                  color: appTheme.primaryTheme,
                )),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.VIDEO_SCREEN);
                },
                child: SizedBox(
                  height: MySize.getHeight(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "View All",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      Spacing.width(3),
                      Icon(Icons.arrow_forward,
                          color: Colors.grey.shade500,
                          size: MySize.getHeight(15)),
                      Spacing.width(10),
                    ],
                  ),
                ),
              )),
          Spacing.height(5),
          if (!isNullEmptyOrFalse(controller.videoList))
            SizedBox(
              width: MySize.screenWidth,
              height: MySize.getHeight(270),
              child: ListView.separated(
                itemCount: controller.videoList.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(5)),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(MySize.getHeight(5))),
                    child: Container(
                      width: MySize.getWidth(165),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius:
                              BorderRadius.circular(MySize.getHeight(5))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: InkWell(
                              onTap: () {
                                controller.youtubePlayerController =
                                    YoutubePlayerController(
                                        initialVideoId: controller
                                            .videoList[index].videoUrl!
                                            .split(
                                                "https://www.youtube.com/embed/")[1]);
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
                                                .videoList[index].videoUrl!
                                                .split(
                                                    "https://www.youtube.com/embed/")[1]),
                                        height: MySize.getHeight(120),
                                        width: MySize.screenWidth),
                                    Image.asset(
                                      imagePath + "youtube_icon.png",
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
                                controller.videoList[index].title.toString(),
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
                                DateFormat("dd MMM, yy").format(controller
                                    .videoList[index].dateTimeCreatedAt!),
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
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: MySize.getWidth(5),
                  );
                },
              ),
            )
          else
            Container(
              width: MySize.screenWidth,
              height: MySize.getHeight(100),
              alignment: Alignment.center,
              child: Text(
                "No data found...",
                style: TextStyle(fontSize: MySize.getHeight(18)),
              ),
            ),
        ],
      ),
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
