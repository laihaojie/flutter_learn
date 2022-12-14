import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('旋转屏幕布局'),
      ),
      // body: const MyAnswer(),
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Flex(
              direction: orientation == Orientation.portrait
                  ? Axis.vertical
                  : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MyAnswer extends StatelessWidget {
  const MyAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flex(
        // 根据屏幕是否横屏来决定主轴方向
        direction: MediaQuery.of(context).orientation == Orientation.portrait
            ? Axis.vertical
            : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          5,
          (index) => Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
