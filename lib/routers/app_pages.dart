import 'package:flutter_learn/pages/detail_page/detail_controller.dart';
import 'package:flutter_learn/pages/detail_page/detail_page.dart';
import 'package:flutter_learn/pages/main_navigation.dart';
import 'package:get/get.dart';
part 'app_routers.dart';

class AppPages {
  static const initial = AppRouters.main;

  static final routes = [
    GetPage(
      name: AppRouters.main,
      page: () => const MainNavigation(),
      binding: MainNavigationBinding(),
      children: const [
        // GetPage(
        //   name: AppRouters.home,
        //   page: () => const HomePage(),
        // ),
        // GetPage(
        //   name: AppRouters.me,
        //   page: () => const MePage(),
        // ),
      ],
    ),
    GetPage(
      name: AppRouters.detail,
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
  ];
}
