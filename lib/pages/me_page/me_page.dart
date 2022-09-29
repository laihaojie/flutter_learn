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

void previewImage(
  BuildContext context, {
  String? currentUrl,
  required List<String> urls,
}) {
  // 通过 navigator 去 PreviewImageWidget 不用动画
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          PreviewImageWidget(currentUrl: currentUrl, urls: urls),
    ),
  );
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

class PreviewImageWidget extends StatelessWidget {
  final String? currentUrl;
  final List<String> urls;

  const PreviewImageWidget({
    super.key,
    this.currentUrl,
    required this.urls,
  });

  @override
  Widget build(BuildContext context) {
    return urls.isEmpty
        ? GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Material(
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    '图片不存在',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          )
        : PageView(
            pageSnapping: true, // 是否自动贴合边界
            controller: currentUrl == null
                ? null
                : PageController(
                    initialPage: urls.indexOf(currentUrl!),
                  ),
            children: [
              for (int i = 0; i < urls.length; i++)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: InteractiveViewer(
                    maxScale: 3,
                    child: Image.network(
                      urls[i],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
            ],
          );
  }
}
