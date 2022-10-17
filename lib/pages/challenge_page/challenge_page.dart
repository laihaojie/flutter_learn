import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'challenge/first.dart';
import 'challenge/four.dart';
import 'challenge/three.dart';
import 'challenge/two.dart';
import 'challenge_controller.dart';

class ChallengePage extends GetView<ChallengeController> {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ListTile(
            title: const Text('旋转屏幕布局'),
            onTap: () => Get.to(() => const First()),
          ),
          ListTile(
            title: const Text('图片淡入淡出'),
            onTap: () => Get.to(() => const Two()),
          ),
          ListTile(
            title: const Text('带icon的按钮'),
            onTap: () => Get.to(() => const Three()),
          ),
          ListTile(
            title: const Text('右上角加水印标记'),
            onTap: () => Get.to(() => const Four()),
          ),
        ],
      ),
    );
  }
}
