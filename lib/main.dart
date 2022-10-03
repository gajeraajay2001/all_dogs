import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'app/constants/app_module.dart';
import 'app/routes/app_pages.dart';

final getIt = GetIt.instance;
GetStorage box = GetStorage();
void main() async {
  await GetStorage.init();
  setUp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: ThemeData(canvasColor: Colors.white),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
