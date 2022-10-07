import 'package:all_dogs/app/constants/color_constant.dart';
import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:all_dogs/app/routes/app_pages.dart';
import 'package:all_dogs/app/utilities/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNewArrivalWidget extends StatefulWidget {
  const HomeNewArrivalWidget({Key? key}) : super(key: key);

  @override
  State<HomeNewArrivalWidget> createState() => _HomeNewArrivalWidgetState();
}

class _HomeNewArrivalWidgetState extends State<HomeNewArrivalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              "NEW ARRIVALS",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: MySize.getHeight(18)),
            ),
          ),
          Center(
            child: SizedBox(
                height: MySize.getHeight(10),
                width: MySize.getWidth(100),
                child: Divider(
                  color: appTheme.secondaryTheme,
                )),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  Spacing.width(3),
                  Icon(Icons.arrow_forward,
                      color: Colors.grey.shade500, size: MySize.getHeight(15)),
                  Spacing.width(10),
                ],
              )),
          Spacing.height(5),
          SizedBox(
            width: MySize.screenWidth,
            height: MySize.getHeight(335),
            child: ListView.separated(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: Container(
                    color: Colors.grey.shade50,
                    width: MySize.getWidth(180),
                    padding: EdgeInsets.symmetric(
                        horizontal: MySize.getWidth(8),
                        vertical: MySize.getHeight(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MySize.getHeight(140),
                          width: MySize.getWidth(200),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(MySize.getHeight(5)),
                                child: Container(
                                  height: MySize.getHeight(120),
                                  width: MySize.screenWidth,
                                  alignment: Alignment.center,
                                  child: getImageByLink(
                                    url: "",
                                    boxFit: BoxFit.cover,
                                    height: MySize.getHeight(120),
                                    width: MySize.screenWidth,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: MySize.getWidth(10),
                                child: Container(
                                  height: MySize.getHeight(52),
                                  width: MySize.getWidth(37),
                                  decoration: BoxDecoration(
                                    color: appTheme.secondaryTheme,
                                    borderRadius: BorderRadius.circular(
                                        MySize.getHeight(3)),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: MySize.getHeight(5),
                                      horizontal: MySize.getWidth(5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Aug",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MySize.getHeight(12),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Spacing.height(5),
                                      Text(
                                        "26",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MySize.getHeight(12),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacing.height(10),
                        Text(
                          "Havy size Labrador retriever puppies available",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: MySize.getHeight(15)),
                        ),
                        Spacing.height(10),
                        Text(
                          "They're vet checked and are home raised. They are vaccinated and dewormed. They...",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: MySize.getHeight(12)),
                        ),
                        Spacing.height(15),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PUPPIES_DETAILS_SCREEN);
                          },
                          child: getButton(
                            title: "MORE DETAILS",
                            height: 35,
                            width: 125,
                            textSize: 12,
                            borderRadius: 5,
                          ),
                        ),
                        Spacing.height(8),
                        Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: appTheme.secondaryTheme,
                              size: MySize.getHeight(28),
                            ),
                            Spacing.width(10),
                            Text(
                              "Posted by",
                              style: TextStyle(fontSize: MySize.getHeight(13)),
                            ),
                            Spacer(),
                            Text(
                              "Kumer",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MySize.getHeight(13)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: MySize.getWidth(10),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
