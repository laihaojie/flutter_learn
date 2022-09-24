import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/me_page/me_controller.dart';
import 'package:flutter_learn/routers/app_pages.dart';
import 'package:get/get.dart';

class MePage extends GetView<MeController> {
  final TabController tabbarController;
  const MePage(this.tabbarController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          GestureDetector(
            onTap: () => controller.add(),
            child: Center(
              child: Column(
                children: [
                  MyText(controller.count.value),
                  MyText(DateTime.now()),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (() {
              Get.toNamed(AppRouters.detail);
            }),
            child: const Text('跳转到详情页'),
          ),
          ElevatedButton(
            onPressed: (() {
              tabbarController.animateTo(0);
            }),
            child: const Text('跳转到首页页'),
          ),
        ],
      ),
    );
  }
}

class MyText extends StatefulWidget {
  const MyText(this.count, {super.key});

  final count;

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text('我的 ${widget.count}');
  }
}
