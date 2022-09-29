import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/me_page/me_controller.dart';
import 'package:flutter_learn/routers/app_pages.dart';
import 'package:get/get.dart';
import 'package:jie_preview_image/jie_preview_image.dart';

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
          ElevatedButton(
            onPressed: (() {
              previewImage(
                context,
                currentUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                urls: [
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                ],
              );
            }),
            child: const Text('图片预览'),
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
