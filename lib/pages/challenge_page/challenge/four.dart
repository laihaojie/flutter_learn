import 'dart:math';

import 'package:flutter/material.dart';

class Four extends StatelessWidget {
  const Four({super.key});

  @override
  Widget build(BuildContext context) {
    const span =
        TextSpan(text: 'Flutter', style: TextStyle(color: Colors.white));

    final textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    )..layout();

    double width = textPainter.width * 2;
    double height = textPainter.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('右上角加水印标记'),
      ),
      // body: const MyAnswer(),
      body: Center(
        child: ClipRect(
          child: Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    'flutter' * 50,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: sqrt(
                  width * width / 2 - sqrt2 * width * height + height * height,
                ),
                right: 0,
                child: Transform.rotate(
                  angle: pi / 4,
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: width,
                    height: height,
                    color: Colors.red,
                    child: const Center(
                      child: Text.rich(span),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAnswer extends StatelessWidget {
  const MyAnswer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // 溢出部分裁剪
        // clipBehavior: Clip.hardEdge,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                'flutter' * 50,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: -30,
            child: Container(
              child: Transform.rotate(
                angle: 45 / 180 * 3.14,
                child: Container(
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'new',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
