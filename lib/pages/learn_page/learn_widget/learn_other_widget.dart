import 'package:flutter/material.dart';

class LearnOtherWidget extends StatelessWidget {
  const LearnOtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtherWidget'),
      ),
      // body: const ScrollPicker(), // 滚动选择器
      body: PageView(
        children: [
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
        ],
      ),
    );
  }
}

class ScrollPicker extends StatelessWidget {
  const ScrollPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: ListWheelScrollView(
        itemExtent: 100, // 每个item的高度
        useMagnifier: true, // 是否开启放大镜效果
        overAndUnderCenterOpacity: 0.5, // 透明度
        diameterRatio: 1.9, // 相对于视口的直径
        // magnification: 1.2, // 当前项放大倍数
        onSelectedItemChanged: (value) => print("选中了: $value"), // change回调
        physics: const FixedExtentScrollPhysics(), // 是否对准中间
        children: List.generate(
          100,
          (index) => Container(
            alignment: Alignment.center,
            color: Colors.blue[50],
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                index.toString(),
                style: const TextStyle(fontSize: 72),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
