import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/home_page/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  final TabController tabbarController;
  const HomePage(this.tabbarController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.increment(),
        child: Center(
          child: Text('首页 ${controller.counter}'),
        ),
      ),
    );
  }
}
