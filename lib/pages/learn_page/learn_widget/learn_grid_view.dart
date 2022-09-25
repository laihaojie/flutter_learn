import 'package:flutter/material.dart';

class LearnGridView extends StatelessWidget {
  const LearnGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      // body: const GridViewDelegate(),
      // body: const GridViewExtent(),
      body: const GridViewCount(),
    );
  }
}

class GridViewCount extends StatelessWidget {
  const GridViewCount({
    Key? key,
  }) : super(key: key);

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
  const GridViewExtent({
    Key? key,
  }) : super(key: key);

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
  const GridViewDelegate({
    Key? key,
  }) : super(key: key);

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
