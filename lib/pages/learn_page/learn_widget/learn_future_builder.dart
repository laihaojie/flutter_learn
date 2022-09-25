import 'package:flutter/material.dart';

class LearnFutureBuilder extends StatefulWidget {
  const LearnFutureBuilder({super.key});

  @override
  State<LearnFutureBuilder> createState() => _LearnFutureBuilderState();
}

class _LearnFutureBuilderState extends State<LearnFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LearnFutureBuilder'),
        centerTitle: true,
      ),
      body: Center(
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
      ),
    );
  }
}
