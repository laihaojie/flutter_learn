import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routers/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.initial,
    getPages: AppPages.routes,
  ));
}
