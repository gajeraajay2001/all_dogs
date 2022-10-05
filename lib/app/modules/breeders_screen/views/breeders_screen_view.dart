import 'package:all_dogs/app/utilities/text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizeConstant.dart';
import '../controllers/breeders_screen_controller.dart';

class BreedersScreenView extends GetView<BreedersScreenController> {
  const BreedersScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: MySize.getWidth(10),
                  childAspectRatio: MySize.getHeight(0.77),
                  mainAxisSpacing: MySize.getHeight(10),
                  padding: EdgeInsets.only(top: MySize.getHeight(10)),
                  children: List.generate(20, (index) {
                    return Card(
                      elevation: 6,
                      child: Container(
                        height: MySize.getHeight(300),
                        child: Column(
                          children: [
                            Spacing.height(10),
                            Container(
                              height: MySize.getHeight(68),
                              width: MySize.getWidth(68),
                              child: getImageByLink(
                                  url: "",
                                  height: 68,
                                  width: 68,
                                  imagePlaceHolder: "avatar_placeholder.png"),
                            ),
                            Spacing.height(15),
                            Text(
                              "Gaurav Aalane",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacing.height(15),
                            Text(
                              "proevolutionrx100@gmail.com",
                              style: TextStyle(fontSize: MySize.getHeight(9)),
                            ),
                            Spacing.height(15),
                            Text(
                              "9730080089",
                              style: TextStyle(fontSize: MySize.getHeight(9)),
                            ),
                            Spacing.height(15),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
