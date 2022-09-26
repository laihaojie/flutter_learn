import 'dart:async';

import 'package:flutter/material.dart';

class LearnFutureBuilder extends StatefulWidget {
  const LearnFutureBuilder({super.key});

  @override
  State<LearnFutureBuilder> createState() => _LearnFutureBuilderState();
}

class _LearnFutureBuilderState extends State<LearnFutureBuilder> {
  // 创建一个 StreamController 只有一个监听者
  // final StreamController _controller = StreamController();

  // 创建一个 广播 StreamController 用于多个监听者
  final StreamController _controller = StreamController.broadcast();

  // 创建一个 Stream
  // final Stream _stream =
  //     Stream.periodic(const Duration(seconds: 1), ((computationCount) => 1));

  // 通过函数创建一个 Stream
  Stream<DateTime> getTime() async* {
    while (true) {
      yield DateTime.now();
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  void initState() {
    _controller.stream.listen(
      (event) {
        print('event: $event');
      },
      onError: (error) {
        print('error: $error');
      },
      onDone: () {
        print('done');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder & StreamBuilder'),
        centerTitle: true,
      ),
      // body: const FutureBuilderWidget(),
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 30, color: Colors.blue),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => _controller.sink.add(1),
                child: const Text('添加1'),
              ),
              ElevatedButton(
                onPressed: () => _controller.sink.add(10),
                child: const Text('添加10'),
              ),
              ElevatedButton(
                onPressed: () => _controller.sink.add('hi'),
                child: const Text('添加hi'),
              ),
              ElevatedButton(
                onPressed: () => _controller.sink.addError("error"),
                child: const Text('添加错误'),
              ),
              // ElevatedButton(
              //   onPressed: () => _controller.close(),
              //   child: const Text('关闭'),
              // ),
              StreamBuilder(
                // stream: _stream,
                stream: getTime(),
                // stream: _controller.stream
                //     .where((event) => event is int)
                //     .map((event) => event * 2)
                //     .distinct(),
                builder: (context, snapshot) {
                  print('building');
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text('NONE: 没有数据流');
                    case ConnectionState.waiting:
                      return const Text("WAITING: 等待数据流");
                    case ConnectionState.active:
                      return snapshot.hasError
                          ? Text("ACTIVE: 错误:${snapshot.error}")
                          : Text("ACTIVE: 正确: ${snapshot.data}");
                    case ConnectionState.done:
                      return const Text("DONE: 结束");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1), () => 'hello'),
        initialData: 30,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            return Text('Data: ${snapshot.data}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
