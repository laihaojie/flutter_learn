// ignore_for_file: avoid_print

import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var counter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print('home controller εε§εδΊ');
  }

  void increment() {
    counter++;
  }
}
