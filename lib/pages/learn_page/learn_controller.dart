import 'package:get/get.dart';

class LearnController extends GetxController {
  var count = 1.obs;
}

class LearnPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnController>(() => LearnController());
  }
}
