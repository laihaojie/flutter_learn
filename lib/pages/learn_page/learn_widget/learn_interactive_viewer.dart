// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';

class LearnInteractiveViewer extends StatelessWidget {
  const LearnInteractiveViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InteractiveViewer'),
      ),
      body: InteractiveViewer(
        // 限制缩放的最大倍数
        maxScale: 2,
        // 限制缩放的最小倍数
        minScale: 0.5,
        // 是否允许双指缩放
        scaleEnabled: true,
        // 是否允许双指旋转
        // rotateEnabled: true,
        panEnabled: true,
        constrained: true,
        // 外边距
        // boundaryMargin: const EdgeInsets.all(20),
        child: Container(
          color: Colors.blue,
          child: Text('Hello World' * 500),
        ),
      ),
    );
  }
}
