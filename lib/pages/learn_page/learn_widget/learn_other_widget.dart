import 'package:flutter/material.dart';

class LearnOtherWidget extends StatelessWidget {
  const LearnOtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtherWidget'),
      ),
      body: const ScrollPicker(), // 滚动选择器
      // body: const ScrollPageView(), // 全屏滚动
      // body: const ReorderableListViewWidget(), // 可排序列表
      // body: const ScrollView(), // 滚动视图
      // body: const DefaultTextStyleWidget(), // 默认文本样式
    );
  }
}

class DefaultTextStyleWidget extends StatelessWidget {
  const DefaultTextStyleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // DefaultTextStyle.merge() 会将当前 DefaultTextStyle 的属性合并到子树中
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 40, color: Colors.red),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('hello'),
            Text('哈哈哈'),
          ],
        ),
      ),
    );
  }
}

class ScrollView extends StatelessWidget {
  const ScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          FlutterLogo(size: 500),
          FlutterLogo(size: 500),
        ],
      ),
    );
  }
}

class ReorderableListViewWidget extends StatelessWidget {
  const ReorderableListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      header: const Center(child: Text('header')),
      onReorder: ((oldIndex, newIndex) => print(oldIndex)),
      children: List.generate(
        20,
        (index) => Container(
          key: ValueKey(index),
          height: 100,
          color: Colors.primaries[index % Colors.primaries.length],
          child: Center(child: Text('Item $index')),
        ),
      ),
    );
  }
}

class ScrollPageView extends StatelessWidget {
  const ScrollPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: false, // 是否自动贴合边界
      scrollDirection: Axis.vertical, // 滚动方向
      onPageChanged: (value) => print(value), // 页面改变时回调
      children: [
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
      ],
    );
  }
}

class ScrollPicker extends StatelessWidget {
  const ScrollPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: ListWheelScrollView(
        itemExtent: 100, // 每个item的高度
        useMagnifier: true, // 是否开启放大镜效果
        overAndUnderCenterOpacity: 0.5, // 透明度
        diameterRatio: 1.9, // 相对于视口的直径
        // magnification: 1.2, // 当前项放大倍数
        onSelectedItemChanged: (value) => print("选中了: $value"), // change回调
        physics: const FixedExtentScrollPhysics(), // 是否对准中间
        children: List.generate(
          100,
          (index) => Container(
            alignment: Alignment.center,
            color: Colors.blue[50],
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                index.toString(),
                style: const TextStyle(fontSize: 72),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
