import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage(this.tabbarController, {super.key});
  final TabController tabbarController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const FlutterLogo(size: 100),
          const FlutterLogo(size: 100),
          const FlutterLogo(size: 100),
          // ignore: avoid-shrink-wrap-in-lists
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Text('index: $index ${controller.counter}');
            },
          ),
        ],
      ),
    );
  }
}
