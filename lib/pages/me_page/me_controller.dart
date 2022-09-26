import 'package:get/get.dart';

class MeController extends GetxController {
  var count = 0.obs;

  @override
  onInit() {
    super.onInit();
    print('MeController onInit');
  }

  add() {
    count++;
  }
}
