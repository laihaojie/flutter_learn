import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/detail_page/detail_controller.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DetailPage')),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('DetailController: ${controller.name}'),
              ElevatedButton(
                onPressed: () => controller.back(),
                child: const Text('回到上一页'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
