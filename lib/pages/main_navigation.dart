import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/home_page/home_page.dart';
import 'package:flutter_learn/pages/learn_page/learn_page.dart';
import 'package:flutter_learn/pages/main_navigation_controller.dart';
import 'package:flutter_learn/pages/me_page/me_page.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

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
          length: 3,
          controller: controller.tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), child: Text("Tab1")),
            Tab(icon: Icon(Icons.chat), child: Text("Tab2")),
            Tab(icon: Icon(Icons.book), child: Text("Tab3")),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(items: const [
        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Tab1")),
        //   BottomNavigationBarItem(icon: Icon(Icons.chat), label: ("Tab2")),
        //   BottomNavigationBarItem(icon: Icon(Icons.book), label: ("Tab3")),
        // ]),
        body: GFTabBarView(
          controller: controller.tabController,
          children: <Widget>[
            HomePage(controller.tabController),
            const LearnPage(),
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
