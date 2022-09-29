import 'package:flutter/material.dart';

// ignore: prefer-correct-type-name
class LearnCompositedTransformFollowerAndCompositedTransformTarget
    extends StatefulWidget {
  const LearnCompositedTransformFollowerAndCompositedTransformTarget({
    super.key,
  });

  @override
  State<LearnCompositedTransformFollowerAndCompositedTransformTarget>
      createState() =>
          _LearnCompositedTransformFollowerAndCompositedTransformTargetState();
}

// ignore: prefer-correct-type-name
class _LearnCompositedTransformFollowerAndCompositedTransformTargetState
    extends State<
        LearnCompositedTransformFollowerAndCompositedTransformTarget> {
  final LayerLink _layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CompositedTransformFollower'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CompositedTransformTarget(
                link: _layerLink,
                child: const Text('跟着我走'),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  // showWhenUnlinked: false, // 跟丢了就不显示
                  // offset: const Offset(0, 100), // 偏移量
                  child: const Center(child: Text('Hello World')),
                ),
              ),
              const Placeholder(
                fallbackHeight: 2000,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CompositedTransformFollower(
        link: _layerLink,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
