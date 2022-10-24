import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jie_preview_image/jie_preview_image.dart';

import '../../routers/app_pages.dart';
import 'me_controller.dart';

class MePage extends GetView<MeController> {
  const MePage(this.tabbarController, {super.key});
  final TabController tabbarController;

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
            onPressed: () {
              Get.toNamed(AppRouters.detail);
            },
            child: const Text('跳转到详情页'),
          ),
          ElevatedButton(
            onPressed: () {
              tabbarController.animateTo(0);
            },
            child: const Text('跳转到首页页'),
          ),
          TestContext(key: UniqueKey(), controller: controller),
          ElevatedButton(
            onPressed: () {
              // show dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('提示'),
                  content: const Text('这是一个提示'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('取消'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('确定'),
                    ),
                  ],
                ),
              );
              // 五秒后跳转到首页
              Future.delayed(const Duration(seconds: 2), () {
                Get.toNamed(AppRouters.detail);
              });
            },
            child: const Text('showDialog'),
          ),
        ],
      ),
    );
  }
}

class TestContext extends StatelessWidget {
  const TestContext({
    super.key,
    required this.controller,
  });

  final MeController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        previewImage(
          context,
          currentUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          urls: [
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          ],
        );
      },
      child: Text('图片预览${controller.count.value}'),
    );
  }
}

class MyText extends StatefulWidget {
  const MyText(this.count, {super.key});

  // ignore: avoid-dynamic
  final dynamic count;

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text('我的 ${widget.count}');
  }
}
