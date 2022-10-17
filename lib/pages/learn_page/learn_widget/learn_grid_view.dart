import 'package:flutter/material.dart';

class LearnGridView extends StatelessWidget {
  const LearnGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: const GridViewDelegate(), // GridView 委托
      // body: const GridViewExtent(), // 通过指定每个子元素的最大宽度来创建网格
      // body: const GridViewCount(), // 通过数量创建网格
    );
  }
}

class GridViewCount extends StatelessWidget {
  const GridViewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 2 / 1,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: [
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
        Container(color: Colors.purple),
        Container(color: Colors.orange),
        Container(color: Colors.pink),
        Container(color: Colors.brown),
        Container(color: Colors.cyan),
        Container(color: Colors.indigo),
        Container(color: Colors.lime),
        Container(color: Colors.teal),
      ],
    );
  }
}

class GridViewExtent extends StatelessWidget {
  const GridViewExtent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      children: const [
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

class GridViewDelegate extends StatelessWidget {
  const GridViewDelegate({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // 根据指定一行数量显示的列数
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3, // 每行3列
      //   mainAxisSpacing: 10, // 主轴(竖直)方向间距
      //   crossAxisSpacing: 10, // 次轴(水平)方向间距
      //   childAspectRatio: 2 / 1, // 子组件宽高长度比例
      // ),
      // 根据指定子组件最大宽度显示的列数
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // 子组件最大长度
        mainAxisSpacing: 10, // 主轴(竖直)方向间距
        crossAxisSpacing: 10, // 次轴(水平)方向间距
        childAspectRatio: 2 / 1, // 子组件宽高长度比例
      ),
      shrinkWrap: true, // 真空包装 包裹住子元素 解决无限高度问题
      // physics: const NeverScrollableScrollPhysics(), // 禁用滚动事件
      physics: const BouncingScrollPhysics(), // 弹性滚动
      itemCount: 100,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          child: Center(
            child: Text(
              '$index',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
