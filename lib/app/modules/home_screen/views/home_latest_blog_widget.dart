import 'package:flutter/material.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../utilities/buttons.dart';

class HomeLatestBlogWidget extends StatefulWidget {
  const HomeLatestBlogWidget({Key? key}) : super(key: key);

  @override
  State<HomeLatestBlogWidget> createState() => _HomeLatestBlogWidgetState();
}

class _HomeLatestBlogWidgetState extends State<HomeLatestBlogWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              "LATEST BLOG",
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
            height: MySize.getHeight(310),
            child: ListView.separated(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: MySize.getWidth(20)),
              itemBuilder: (context, index) {
                return Card(
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
                          child: ClipRRect(
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
                        ),
                        Spacing.height(10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "By : Admin / 25 Aug, 22",
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: MySize.getHeight(10)),
                          ),
                        ),
                        Spacing.height(10),
                        Text(
                          "Budget friendly dog breeds - Price of Indian Spitz and Pomeranian",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: MySize.getHeight(15)),
                        ),
                        Spacing.height(10),
                        Text(
                          "Selecting a breed of dog in general should not be a matter of affordability. It ...",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: MySize.getHeight(12)),
                        ),
                        Spacing.height(20),
                        getButton(
                          title: "MORE DETAILS",
                          height: 35,
                          width: 125,
                          textSize: 12,
                          borderRadius: 5,
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
