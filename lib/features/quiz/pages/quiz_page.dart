import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psycho/models/question_tracker.dart';
import 'package:psycho/providers/quiz_provider.dart';
import 'package:psycho/widgets/progress_dot_widget.dart';

class QuizPage extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psychology Test'),
      ),
      body: Consumer<QuizProvider>(
        builder: (context, data, child) {
          QuestionTracker progressTracker = QuestionTracker(data.questions);

          progressTracker.updateProgress(data.currentIndex);
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            _scrollToCurrentIndex(context, data.currentIndex);
          });

          return Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.questions.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ProgressDotWidget(
                        status: data.questions[index].status,
                        index: index + 1,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: data.questions.length,
                  itemBuilder: (context, index) {
                    return Visibility(
                      visible: data.currentIndex == index,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.currentIndex + 1}/74. ${data.questions[index].questionText}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: data.testSubmitted
                                    ? null
                                    : () {
                                        data.answerQuestion('No');
                                      },
                                child: const Text('Нет'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: data.testSubmitted
                                    ? null
                                    : () {
                                        data.answerQuestion('Yes');
                                      },
                                child: const Text('Да'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _scrollToCurrentIndex(BuildContext context, int currentIndex) {
    Scrollable.ensureVisible(
      context,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      alignment: 0.5,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
