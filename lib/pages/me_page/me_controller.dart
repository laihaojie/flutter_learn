import 'package:get/get.dart';

class MeController extends GetxController {
  var count = 0.obs;

  add() {
    count++;
  }
}
