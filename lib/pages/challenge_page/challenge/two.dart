import 'package:flutter/material.dart';

class Two extends StatefulWidget {
  const Two({super.key});

  @override
  State<Two> createState() => _TwoState();
}

class _TwoState extends State<Two> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图片淡入淡出'),
      ),
      // body: const MyAnswer(),
      body: Center(
        child: GestureDetector(
          onTap: (() {
            setState(() {
              _visible = !_visible;
            });
          }),
          child: AnimatedCrossFade(
            firstChild: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
            ),
            secondChild: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            ),
            firstCurve: const Interval(0.0, 0.5),
            secondCurve: const Interval(0.5, 1.0),
            crossFadeState:
                _visible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}

class MyAnswer extends StatefulWidget {
  const MyAnswer({Key? key}) : super(key: key);

  @override
  State<MyAnswer> createState() => _MyAnswerState();
}

class _MyAnswerState extends State<MyAnswer> {
  bool _visible = true;
  bool img = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (() {
          setState(() {
            _visible = !_visible;
          });
        }),
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          onEnd: () {
            setState(() {
              // _visible = !_visible;
              img = !img;
            });
          },
          duration: const Duration(seconds: 1),
          child: Image.network(
            img
                ? 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'
                : 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          ),
        ),
      ),
    );
  }
}
