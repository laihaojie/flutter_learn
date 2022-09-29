import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/learn_page/learn_controller.dart';
import 'package:flutter_learn/pages/learn_page/learn_dart_api/learn_compute.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_composited_transform_follower_and_composited_transform_target.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_fitted_box.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_future_builder.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_interactive_viewer.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_layout_builder.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_other_widget.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_grid_view.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_list_view.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_safe_area.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_sliver_widget.dart';
import 'package:flutter_learn/pages/learn_page/learn_widget/learn_will_pop_scope.dart';
import 'package:get/get.dart';

class LearnPage extends GetView<LearnController> {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          const Center(
            child: Text("Flutter Widget", style: TextStyle(fontSize: 50)),
          ),
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
          ListTile(
            title: const Text("SliverWidget"),
            subtitle: const Text('滚动组件'),
            onTap: () => Get.to(() => const LearnSliverWidget()),
          ),
          ListTile(
            title: const Text("WillPopScope"),
            subtitle: const Text('禁用返回键'),
            onTap: () => Get.to(() => const LearnWillPopScope()),
          ),
          ListTile(
            title: const Text("FittedBox"),
            subtitle: const Text('字体大小自适应父组件-宽度'),
            onTap: () => Get.to(() => const LearnFittedBox()),
          ),
          ListTile(
            title: const Text("SafeArea"),
            subtitle: const Text('安全区域 最小边距padding'),
            onTap: () => Get.to(() => const LearnSafeArea()),
          ),
          ListTile(
            title: const Text("LayoutBuilder & OrientationBuilder"),
            subtitle: const Text(
              'LayoutBuilder 获取父组件传递的约束大小- 实现自适应 父亲高度的一半\r\n OrientationBuilder 获取屏幕方向',
            ),
            onTap: () => Get.to(() => const LearnLayoutBuilder()),
          ),
          ListTile(
            title: const Text("InteractiveViewer"),
            subtitle: const Text('二维平面缩放'),
            onTap: () => Get.to(() => const LearnInteractiveViewer()),
          ),
          ListTile(
            title: const Text(
              "CompositedTransformFollower and CompositedTransformTarget",
            ),
            subtitle: const Text('组件跟随'),
            onTap: () => Get.to(
              () =>
                  const LearnCompositedTransformFollowerAndCompositedTransformTarget(),
            ),
          ),
          const Center(
            child: Text("Dart API", style: TextStyle(fontSize: 50)),
          ),
          ListTile(
            title: const Text("compute"),
            subtitle: const Text('启动新的线程 - 异步计算'),
            onTap: () => Get.to(() => const LearnCompute()),
          ),
        ],
      ),
    );
  }
}
