import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/api_constants.dart';
import '../controllers/puppies_details_screen_controller.dart';

class PuppiesDetailsScreenView
    extends GetWidget<PuppiesDetailsScreenController> {
  const PuppiesDetailsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: MySize.getHeight(60),
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
            actions: [
              Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(
                      right: MySize.getWidth(10), top: MySize.getHeight(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: MySize.getWidth(5)),
                        child: LikeButton(
                          size: MySize.getHeight(22),
                          animationDuration: Duration(milliseconds: 400),
                          likeBuilder: (val) {
                            return Icon(
                              Icons.favorite,
                              color: (val) ? Colors.red : Colors.grey,
                            );
                          },
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: Colors.red,
                            dotSecondaryColor: Colors.red,
                            dotLastColor: Colors.red,
                            dotThirdColor: Colors.red,
                          ),
                          circleColor: CircleColor(
                            start: Colors.red,
                            end: Colors.red,
                          ),
                        ),
                      ),
                      Spacing.height(5),
                      Row(
                        children: [
                          SvgPicture.asset(
                            imagePath + "eye_icon.svg",
                            color: Colors.grey,
                            height: MySize.getHeight(15),
                          ),
                          Spacing.width(5),
                          Text(
                            "10 views",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: MySize.getHeight(9)),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Spacing.height(5),
                  Text(
                    "Toy Pom Pup's Available",
                    style: TextStyle(
                        fontSize: MySize.getHeight(18),
                        fontWeight: FontWeight.w500),
                  ),
                  Spacing.height(5),
                  Text(
                    "Posted by Sumit on 18 Sep, 22",
                    style: TextStyle(
                        fontSize: MySize.getHeight(10),
                        fontWeight: FontWeight.w300),
                  ),
                  Spacing.height(30),
                  getBannerWidget(),
                  Spacing.height(20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    InkWell(
                        onTap: () {
                          controller.carouselController.previousPage();
                        },
                        child: getBannerArrow(image: "left_arrow.svg")),
                    Spacing.width(25),
                    InkWell(
                        onTap: () {
                          controller.carouselController.nextPage();
                        },
                        child: getBannerArrow(image: "right_arrow.svg")),
                  ]),
                  Spacing.height(30),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
                    child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: getContainer(
                                    text1: "AVAILABLE", text2: "Yes"),
                              ),
                              Spacing.width(25),
                              Expanded(
                                child: getContainer(
                                    text1: "BREED", text2: "Toy Pom"),
                              ),
                            ]),
                        Spacing.height(20),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: getContainer(
                                    text1: "DOB", text2: "11 Sep, 22"),
                              ),
                              Spacing.width(25),
                              Expanded(
                                child: getContainer(
                                    text1: "MOBILE", text2: "7232887000"),
                              ),
                            ]),
                        Spacing.height(20),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: getContainer(
                                    text1: "LOCATION", text2: "Bhiwadi"),
                              ),
                            ]),
                        Spacing.height(20),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: getContainer(
                                    text1: "DESCRIPTION",
                                    text2:
                                        "For quick response WhatsApp please@+918798055319. Cute well trained and welcoming male and female Shih Tzu puppies available. They are up to date on all shots and vaccines. Very friendly with people. They will be coming with all papers at lankaad.ik Thanks for the time. .WhatsApp. +918798055319"),
                              ),
                            ]),
                        Spacing.height(60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getButtonContainer(image: "call_icon.svg"),
                            Spacing.width(30),
                            getButtonContainer(image: "mail_icon.svg"),
                            Spacing.width(30),
                            getButtonContainer(image: "whatsapp_icon.svg"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget getBannerWidget() {
    return Container(
      height: MySize.getHeight(200),
      width: MySize.screenWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider(
            carouselController: controller.carouselController,
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 1,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              height: MySize.screenWidth,
              onPageChanged: (val, _) {
                controller.selectedBannerIndex.value = val;
              },
            ),
            items: List.generate(controller.bannerList.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(MySize.getHeight(15)),
                    child: Container(
                      width: MySize.screenWidth,
                      child: Image.asset(
                          imagePath + controller.bannerList[index],
                          fit: BoxFit.cover),
                    )),
              );
            }),
          ),
          Positioned(
            bottom: MySize.getHeight(10),
            child: Container(
              child: AnimatedSmoothIndicator(
                count: controller.bannerList.length,
                activeIndex: controller.selectedBannerIndex.value,
                effect: WormEffect(
                  dotHeight: MySize.getHeight(8),
                  dotWidth: MySize.getWidth(8),
                  type: WormType.thin,
                  activeDotColor: appTheme.secondaryTheme,
                  dotColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBannerArrow({required String image}) {
    return Container(
      height: MySize.getHeight(35),
      width: MySize.getWidth(35),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black.withOpacity(0.05),
            blurRadius: MySize.getHeight(7),
            spreadRadius: MySize.getHeight(2),
          ),
        ],
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        imagePath + image,
        height: MySize.getHeight(25),
      ),
    );
  }

  Widget getContainer({
    required String text1,
    required String text2,
  }) {
    return Container(
      padding: EdgeInsets.only(
          top: MySize.getHeight(20),
          bottom: MySize.getHeight(20),
          left: MySize.getWidth(20),
          right: MySize.getWidth(10)),
      constraints: BoxConstraints(
          // minHeight: MySize.getHeight(60),
          ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.black.withOpacity(0.05),
              blurRadius: MySize.getHeight(7),
              spreadRadius: MySize.getHeight(2),
            ),
          ],
          borderRadius: BorderRadius.circular(MySize.getHeight(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Spacing.height(5),
          Text(
            text2,
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: MySize.getHeight(11)),
          ),
        ],
      ),
    );
  }

  Widget getButtonContainer({required String image}) {
    return Container(
      height: MySize.getHeight(60),
      width: MySize.getWidth(60),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.black.withOpacity(0.05),
              blurRadius: MySize.getHeight(7),
              spreadRadius: MySize.getHeight(2),
            ),
          ],
          borderRadius: BorderRadius.circular(MySize.getHeight(10))),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        imagePath + image,
        height: MySize.getHeight(28),
        width: MySize.getWidth(28),
      ),
    );
  }
}
