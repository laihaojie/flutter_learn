import 'package:flutter/material.dart';
import 'package:flutter_learn/routers/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.initial,
    getPages: AppPages.routes,
  ));
}
