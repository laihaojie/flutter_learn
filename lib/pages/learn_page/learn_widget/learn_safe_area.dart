import 'package:flutter/material.dart';

class LearnSafeArea extends StatefulWidget {
  const LearnSafeArea({super.key});

  @override
  State<LearnSafeArea> createState() => _LearnSafeAreaState();
}

class _LearnSafeAreaState extends State<LearnSafeArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeArea'),
      ),
      body: SafeArea(
        // 设置最小边距 如果安全区域留白超过20，则不会生效 但是如果安全区域没有留白，则会生效
        minimum: const EdgeInsets.all(20),
        child: Container(
          color: Colors.blue,
          child: Text('Hello World' * 500),
        ),
      ),
    );
  }
}
