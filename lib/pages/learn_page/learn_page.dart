import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/learn_page/learn_controller.dart';
import 'package:get/get.dart';

class LearnPage extends GetView<LearnController> {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('LearnPage ${controller.count}'),
          ListTile(
            title: const Text("导航-返回"),
            subtitle: const Text('Get.back()'),
            onTap: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
