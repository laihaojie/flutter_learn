import 'package:flutter/material.dart';

class LearnLayoutBuilder extends StatelessWidget {
  const LearnLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                // 自适应父亲高度的一半
                height: constraints.maxHeight / 2,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "自适应父亲高度的一半 \r\n LayoutBuilder",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              OrientationBuilder(builder: (context, orientation) {
                return Container(
                  width: double.infinity,
                  height: constraints.maxHeight / 2,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      "获取屏幕旋转方向\r\n OrientationBuilder",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
