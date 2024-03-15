import 'package:flutter/material.dart';

class TestResultPage extends StatelessWidget {
  final int counter1;
  final int counter2;
  final int counter3;
  final int counter4;

  const TestResultPage({
    super.key,
    required this.counter1,
    required this.counter2,
    required this.counter3,
    required this.counter4,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('шкала искренности: $counter1'),
            Text('шкала депрессивности: $counter2'),
            Text('шкала невротизации: $counter3'),
            Text('шкала общительности: $counter4'),
          ],
        ),
      ),
    );
  }
}
