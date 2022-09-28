import 'package:flutter/material.dart';

class LearnFittedBox extends StatelessWidget {
  const LearnFittedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FittedBox'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.blue,
          child: const FittedBox(
            // fit: BoxFit.scaleDown, // 适配文字换行
            child: Text("Hello World", style: TextStyle(fontSize: 50)),
          ),
        ),
      ),
    );
  }
}
