import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'challenge_page/challenge_page.dart';
import 'home_page/home_page.dart';
import 'learn_page/learn_page.dart';
import 'main_navigation_controller.dart';
import 'me_page/me_page.dart';

class MainNavigation extends GetView<MainNavigationController> {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.title.value,
          ),
        ),
        bottomNavigationBar: GFTabBar(
          // key: AppPages.globalKey,
          length: 4,
          controller: controller.tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), child: Text('Tab1')),
            Tab(icon: Icon(Icons.home), child: Text('Tab1')),
            Tab(icon: Icon(Icons.chat), child: Text('Tab2')),
            Tab(icon: Icon(Icons.book), child: Text('Tab3')),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(items: const [
        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Tab1")),
        //   BottomNavigationBarItem(icon: Icon(Icons.chat), label: ("Tab2")),
        //   BottomNavigationBarItem(icon: Icon(Icons.book), label: ("Tab3")),
        // ]),
        body: GFTabBarView(
          // 禁用左右滚动切换
          physics: const NeverScrollableScrollPhysics(),
          // physics: const BouncingScrollPhysics(),
          controller: controller.tabController,
          children: <Widget>[
            const LearnPage(),
            const ChallengePage(),
            HomePage(controller.tabController),
            // Container(
            //   color: Colors.white,
            //   child: GestureDetector(
            //     onTap: () => controller.increment(1),
            //     child:
            //         Obx(() => Center(child: Text(controller.count.toString()))),
            //   ),
            // ),
            MePage(controller.tabController),
          ],
        ),
      ),
    );
  }
}
