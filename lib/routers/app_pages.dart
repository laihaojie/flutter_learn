import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../pages/detail_page/detail_controller.dart';
import '../pages/detail_page/detail_page.dart';
import '../pages/detail_page/test1_page.dart';
import '../pages/detail_page/test2_page.dart';
import '../pages/main_navigation.dart';
import '../pages/main_navigation_controller.dart';

part 'app_routers.dart';

class AppPages {
  static const initial = AppRouters.main;
  static var globalKey = GlobalKey<NavigatorState>();
  static final routes = [
    GetPage(
      name: AppRouters.main,
      page: () => MainNavigation(
        key: globalKey,
      ),
      binding: MainNavigationBinding(),
    ),
    GetPage(
      name: AppRouters.detail,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(name: AppRouters.test1, page: () => const Test1Page()),
    GetPage(name: AppRouters.test2, page: () => const Test2Page()),
  ];
}
