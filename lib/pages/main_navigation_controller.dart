import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/home_page/home_controller.dart';
import 'package:flutter_learn/pages/learn_page/learn_controller.dart';
import 'package:flutter_learn/pages/me_page/me_controller.dart';
import 'package:get/get.dart';

class MainNavigationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var count = 10.obs;

  late var tabController = TabController(length: 3, vsync: this);
  late var arg = Get.arguments;
  late final List<String> tabs = [
    "首页",
    "分类",
    "我的",
  ];
  late var title = tabs[tabController.index].obs;

  @override
  void onInit() {
    super.onInit();
    // tabController = TabController(length: 3, vsync: this);
    if (arg != null) {
      var index = arg["index"];
      tabController.animateTo(index);
    }

    tabController.addListener(onChange);

    print('main navigation init');
  }

  onChange() {
    title.value = tabs[tabController.index];
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  increment(int? val) {
    count++;
    count += val ?? 1;
  }
}

class MainNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavigationController>(() => MainNavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LearnController>(() => LearnController());
    // Get.put(HomeController());
    Get.lazyPut<MeController>(() => MeController());
  }
}
