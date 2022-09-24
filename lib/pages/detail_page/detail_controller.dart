import 'package:flutter_learn/routers/app_pages.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var name = 'DetailController'.obs;

  back() {
    Get.offAllNamed(AppRouters.main);
    // Get.until((route) => false);
    // Get.offUntil(
    //   GetPageRoute(page: () => const DetailPage()),
    //   (route) => (route as GetPageRoute).routeName == AppRouters.me,
    // );
  }
}

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}
