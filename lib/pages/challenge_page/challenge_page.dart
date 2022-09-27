import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/challenge_page/challenge/first.dart';
import 'package:flutter_learn/pages/challenge_page/challenge/three.dart';
import 'package:flutter_learn/pages/challenge_page/challenge/two.dart';
import 'package:flutter_learn/pages/challenge_page/challenge_controller.dart';
import 'package:get/get.dart';

class ChallengePage extends GetView<ChallengeController> {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ListTile(
            title: const Text("旋转屏幕布局"),
            // subtitle: const Text('列表'),
            onTap: () => Get.to(() => const First()),
          ),
          ListTile(
            title: const Text("图片淡入淡出"),
            // subtitle: const Text('列表'),
            onTap: () => Get.to(() => const Two()),
          ),
          ListTile(
            title: const Text("带icon的按钮"),
            // subtitle: const Text('列表'),
            onTap: () => Get.to(() => const Three()),
          ),
        ],
      ),
    );
  }
}
