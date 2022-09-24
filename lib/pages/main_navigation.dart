import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/home_page/home_controller.dart';
import 'package:flutter_learn/pages/home_page/home_page.dart';
import 'package:flutter_learn/pages/me_page/me_controller.dart';
import 'package:flutter_learn/pages/me_page/me_page.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  late final List<String> _tabs = [
    "首页",
    "分类",
    "我的",
  ];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    tabController.addListener(onChange);
    super.initState();
  }

  onChange() {
    setState(() {});
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(_tabs[tabController.index]),
      ),
      bottomNavigationBar: GFTabBar(
        length: 3,
        controller: tabController,
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
        controller: tabController,
        children: <Widget>[
          HomePage(tabController),
          Container(color: Colors.white),
          MePage(tabController),
        ],
      ),
    );
  }
}

class MainNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MeController>(() => MeController());
  }
}
