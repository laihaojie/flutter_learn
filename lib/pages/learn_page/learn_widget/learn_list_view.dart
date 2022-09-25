import 'package:flutter/material.dart';

class LearnListView extends StatelessWidget {
  LearnListView({super.key});

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 翻页
          print(_controller.offset);
          _controller.animateTo(
            _controller.offset + 500,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        child: const Icon(Icons.arrow_downward),
      ),
      appBar: AppBar(
        title: GestureDetector(
          onTap: (() {
            // 回到顶部
            _controller.animateTo(
              0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          }),
          child: const Text('ListView'),
        ),
      ),

      // body: const ListVIewSeparated(),
      // body: ListViewController(controller: _controller),
      // body: ListViewScrollbar(controller: _controller),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          print('刷新');
        },
        strokeWidth: 4.0,
        color: Colors.red,
        backgroundColor: Colors.blue,
        child: NotificationListener(
          // 事件冒泡拦截
          onNotification: (notification) {
            print(notification);

            return false; // true:阻止冒泡，false:继续冒泡
          },
          child: ListViewScrollbar(controller: _controller),
        ),
      ),
    );
  }
}

class ListViewScrollbar extends StatelessWidget {
  const ListViewScrollbar({
    Key? key,
    required ScrollController controller,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true, // 是否一直显示滚动条
      controller: _controller,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        controller: _controller,
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            alignment: Alignment.center,
            child: Text('item $index'),
          );
        },
      ),
    );
  }
}

class ListViewController extends StatelessWidget {
  const ListViewController({
    Key? key,
    required ScrollController controller,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100),
      controller: _controller,
      // physics: const NeverScrollableScrollPhysics(), // 限制列表无法滚动
      physics: const BouncingScrollPhysics(), // 下拉到顶部的回弹效果
      itemCount: 100,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          alignment: Alignment.center,
          child: Text('item $index'),
        );
      },
      itemExtent: 100, // 主轴方向高度限制为100
    );
  }
}

class ListVIewSeparated extends StatelessWidget {
  const ListVIewSeparated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // 分割线
      separatorBuilder: (context, index) {
        return const Divider(
          height: 1,
          color: Colors.black,
        );
      },
      itemCount: 100, // 子元素的数量
      cacheExtent: 300, // 缓存区域的高度
      itemBuilder: ((context, index) {
        return Container(
          color: Colors.blue[100 * (index % 9)],
          height: 100,
          alignment: Alignment.center,
          child: Text('Item $index'),
        );
      }),
    );
  }
}
