import 'package:flutter/material.dart';
import 'package:psycho/models/question_status.dart';

class ProgressDotWidget extends StatelessWidget {
  final QuestionStatus status;
  final int index;

  const ProgressDotWidget(
      {super.key, required this.status, required this.index});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case QuestionStatus.Passed:
        color = Colors.green;
        break;
      case QuestionStatus.Current:
        color = Colors.blue;
        break;
      case QuestionStatus.NotReached:
        color = Colors.grey;
        break;
    }

    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: Text(
          (index).toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
