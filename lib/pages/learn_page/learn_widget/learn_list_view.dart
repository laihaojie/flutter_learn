import 'package:flutter/material.dart';

class LearnListView extends StatelessWidget {
  const LearnListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LearnListView'),
      ),

      // body: ListView.builder(
      body: ListView.separated(
        // 分割线
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.black,
          );
        },
        itemCount: 100, // 子元素的数量
        cacheExtent: 300, // 缓存区域的高度
        itemBuilder: ((context, index) {
          return Container(
            color: Colors.blue[100 * (index % 9)],
            height: 100,
            alignment: Alignment.center,
            child: Text('Item $index'),
          );
        }),
      ),
    );
  }
}
