import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}
