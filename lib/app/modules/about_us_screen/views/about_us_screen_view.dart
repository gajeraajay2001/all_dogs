import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_us_screen_controller.dart';

class AboutUsScreenView extends GetWidget<AboutUsScreenController> {
  const AboutUsScreenView({Key? key}) : super(key: key);
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
            'About Us',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: MySize.getHeight(15),
                horizontal: MySize.getWidth(20)),
            child: Column(
              children: [
                Text(
                  "Welcome to allDogs.in, your trustable ally in your search for dogs to adopt. If you are a breeder, you will find it super easy to advertise your litters here for free. If you are a would-be pet parent, you will find it here a host of credible breeders that are verified by us.\n\nWe are a company founded by life-long pet parents. They are more than family to us. We know how important it is for those that are looking to adopt a dog or a pup from credible breeder – we have all been there. It is this very thought to help those – both the experienced and the novice pet parents that we came up with the idea to hand-pick credible breeders across the country and invite them to list their litters here. The credible, genuine and responsible breeders are rare. They always care their babies go!\n\nWe truly hope you find our services a confident aide in helping you find a perfect partner – be it a breeder or a pet parent. We know it is a lifetime of a commitment.\n\nIf you have any questions or comments, or need any help please don't hesitate to contact us at alphas@alldogs.in\n\nGood luck!",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: MySize.getHeight(11)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
