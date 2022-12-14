import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routers/app_pages.dart';
import '../main_navigation_controller.dart';

class Test2Page extends StatelessWidget {
  const Test2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test2Page')),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // 获取 tabController

                  // print((AppPages.globalKey.currentWidget as MainNavigation));
                  Get.until((route) => Get.currentRoute == AppRouters.main);

                  final MainNavigationController mainController = Get.find();
                  final tabController = mainController.tabController;
                  tabController.animateTo(1);
                  mainController.increment(100);
                },
                // onPressed: () => Get.offUntil(
                //   GetPageRoute(
                //     page: () => const MainNavigation(),
                //   ),
                //   (route) => Get.currentRoute == AppRouters.main,
                // ),
                child: const Text('回到上一页'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
