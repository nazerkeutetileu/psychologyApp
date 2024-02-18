import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psycho/models/question_tracker.dart';
import 'package:psycho/providers/quiz_provider.dart';
import 'package:psycho/widgets/progress_dot_widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psychology Test'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => QuizProvider(context),
        child: Consumer<QuizProvider>(
          builder: (context, provider, child) {
            QuestionTracker progressTracker =
                QuestionTracker(provider.questions);

            progressTracker.updateProgress(provider.currentIndex);
            // Scroll to the current index
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              _scrollToCurrentIndex(provider.currentIndex);
            });

            return Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.questions.length,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ProgressDotWidget(
                          status: provider.questions[index].status,
                          index: index + 1,
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.questions.length,
                    itemBuilder: (context, index) {
                      return Visibility(
                        visible: provider.currentIndex == index,
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${provider.currentIndex + 1}/74. ${provider.questions[index].questionText}',
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
                                  onPressed: provider.testSubmitted
                                      ? null
                                      : () {
                                          provider.answerQuestion('No');
                                        },
                                  child: const Text('Нет'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: provider.testSubmitted
                                      ? null
                                      : () {
                                          provider.answerQuestion('Yes');
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
      ),
    );
  }

  void _scrollToCurrentIndex(int currentIndex) {
    _controller.animateTo(
      currentIndex * 20.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
