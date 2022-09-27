import 'package:flutter/material.dart';

class Three extends StatelessWidget {
  const Three({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('带icon的按钮'),
      ),
      // body: const MyAnswer(),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 70,
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.blue, width: 2),
              shape: const StadiumBorder(),
            ),
            icon: const Icon(Icons.add),
            label: const Text('添加'),
          ),
        ),
      ),
    );
  }
}

class MyAnswer extends StatelessWidget {
  const MyAnswer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {},
        // splashColor: Colors.blue,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 300,
          height: 80,
          decoration: BoxDecoration(
            // color: Colors.white,
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add,
                color: Colors.blue,
              ),
              SizedBox(width: 10),
              Text(
                '添加',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
