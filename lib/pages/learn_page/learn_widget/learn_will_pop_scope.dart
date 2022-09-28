import 'package:flutter/material.dart';

class LearnWillPopScope extends StatefulWidget {
  const LearnWillPopScope({super.key});

  @override
  State<LearnWillPopScope> createState() => _LearnWillPopScopeState();
}

class _LearnWillPopScopeState extends State<LearnWillPopScope> {
  bool _locked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WillPopScope'),
      ),
      body: WillPopScope(
        onWillPop: _locked
            ? () async => await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('提示'),
                    content: const Text('确定要退出吗？'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('取消'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('确定'),
                      ),
                    ],
                  ),
                )
            : null,
        child: Center(
          child: TextButton(
            onPressed: () => setState(() => _locked = !_locked),
            child: Icon(
              _locked ? Icons.lock : Icons.lock_open,
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
