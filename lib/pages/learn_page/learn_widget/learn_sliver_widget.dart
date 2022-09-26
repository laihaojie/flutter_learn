import 'package:flutter/material.dart';

class LearnSliverWidget extends StatelessWidget {
  const LearnSliverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            // title: Text('SliverAppBar'),
            pinned: true, // 固定在顶部
            // expandedHeight: 500, // 展开高度
            floating: true, // 滚动时显示
            // stretch: true, // 拉伸
            snap: true, // 滚动时显示
            flexibleSpace: FlexibleSpaceBar(
              title: Text('FlexibleSpaceBar'),
              background: Image(
                image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                ),
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.parallax, // 滚动时的动画效果
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) => Container(
          //       color: Colors.white,
          //       height: 150,
          //       child: Center(
          //         child: Text('item $index'),
          //       ),
          //     ),
          //     childCount: 20,
          //   ),
          // ),
          SliverGrid(
            delegate: SliverChildListDelegate([
              const Icon(Icons.animation),
              const Icon(Icons.animation),
              const Icon(Icons.animation),
            ]),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
          ),
          // 剩余空间
          const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
