import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LearnCompute extends StatefulWidget {
  const LearnCompute({super.key});

  @override
  State<LearnCompute> createState() => _LearnComputeState();
}

class _LearnComputeState extends State<LearnCompute> {
  double? _pi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compute'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_pi.toString()),
            const CircularProgressIndicator(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() => _pi = null);
          // 下面的计算回阻塞UI线程
          // final double pi = estimatePi(1000000000);
          // 启用compute 则是开启新的一个线程 不会导致UI阻塞
          final double pi = await compute(estimatePi, 1000000000);

          setState(() => _pi = pi);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 计算圆周率
double estimatePi(int iterations) {
  double circlePoints = 0;
  for (int i = 0; i < iterations; i += 4) {
    circlePoints += (4 / i) - (4 / (i + 2));
  }

  return circlePoints;
}
