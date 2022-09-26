import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/learn_page/learn_controller.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_future_builder.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_other_widget.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_grid_view.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_list_view.dart';
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
            title: const Text("ListView"),
            subtitle: const Text('列表'),
            onTap: () => Get.to(() => LearnListView()),
          ),
          ListTile(
            title: const Text("GridView"),
            subtitle: const Text('网格布局'),
            onTap: () => Get.to(() => const LearnGridView()),
          ),
          ListTile(
            title: const Text("OtherWight"),
            subtitle: const Text('其他滚动布局'),
            onTap: () => Get.to(() => const LearnOtherWidget()),
          ),
          ListTile(
            title: const Text("FutureBuilder & StreamBuilder"),
            subtitle: const Text('异步组件'),
            onTap: () => Get.to(() => const LearnFutureBuilder()),
          ),
        ],
      ),
    );
  }
}
