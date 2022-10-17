// ignore_for_file: avoid_print

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
          onTap: () {
            // 回到顶部
            _controller.animateTo(
              0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          },
          child: const Text('ListView'),
        ),
      ),

      // body: const ListVIewSeparated(), // 分割线
      // body: ListViewController(controller: _controller), // 滚动监听
      // body: ListViewScrollbar(controller: _controller), // 滚动条
      // body: ListViewRefresh(_controller), // 下拉刷新
      body: ListViewDismissible(controller: _controller), // 滑动删除
    );
  }
}

class ListViewDismissible extends StatelessWidget {
  const ListViewDismissible({
    super.key,
    required ScrollController controller,
  }) : _controller = controller;

  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            // 删除后的回调
            print(direction); // 滑动的方向
          },
          confirmDismiss: (direction) {
            // 确认删除
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('提示'),
                  content: const Text('确定删除吗？'),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('确定'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('取消'),
                    ),
                  ],
                );
              },
            );
          },
          onResize: () {
            // 删除后重绘的回调
            print('onResize');
          },
          // 左边滑动的背景
          background: Container(
            color: Colors.green,
            alignment: Alignment.centerLeft,
            child: const Text('左边'),
          ),
          // 右边滑动的背景
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Text('右边'),
          ),
          direction: DismissDirection.endToStart, // 滑动的方向
          dismissThresholds: const {
            // 滑动的阈值
            DismissDirection.endToStart: 0.5,
            DismissDirection.startToEnd: 0.5,
          },
          resizeDuration: const Duration(milliseconds: 200), // 重绘的时间
          child: Container(
            color: Colors.blue[100 * (index % 9)],
            height: 50,
            alignment: Alignment.center,
            child: Text('item $index'),
          ),
        );
      },
    );
  }
}

class ListViewRefresh extends StatelessWidget {
  const ListViewRefresh(this._controller, {super.key});

  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
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
    );
  }
}

class ListViewScrollbar extends StatelessWidget {
  const ListViewScrollbar({
    super.key,
    required ScrollController controller,
  }) : _controller = controller;

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
    super.key,
    required ScrollController controller,
  }) : _controller = controller;

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
    super.key,
  });

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
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[100 * (index % 9)],
          height: 100,
          alignment: Alignment.center,
          child: Text('Item $index'),
        );
      },
    );
  }
}
