import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PsychoApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> _questions = [
    Question(
        "Я внимательно выслушал инструкцию и готов откровенно ответить на все вопросы"),
    Question(
        "Я часто легко отвлекаюсь от дела, становлюсь рассеянным и мечтательным"),
    Question("Я устаю быстрее, чем большинство окружающих меня людей"),
    Question("Иногда я могу похвастаться"),
    Question("У меня часто бывает веселое настроение."),
    Question("Меня часто одолевают грустные мысли"),
    Question("Я люблю общение с людьми"),
    Question("Нередко чувствую, что у меня немеют или холодеют руки и ноги"),
    Question("Я быстро забываю об огорчениях"),
    Question("Иногда ощущаю стук в висках и пульсацию в области шеи"),
    Question("Я люблю развлекаться в веселой компании"),
    Question("В моей семье есть нервные люди"),
    Question(
        "Бывает что я с уверенностью говорю о вещах, в которых слабо разбираюсь"),
    Question("Временами чувствую себя беспомощным"),
    Question("У меня много хороших знакомых"),
    Question("У меня часто болит голова"),
    Question("Я почти всегда подвижен и активен"),
    Question(
        "Если я сидел, а потом резко встал, то у меня темнеет в глазах и кружиться голова"),
    Question("Иногда я ссылаюсь на болезнь, чтобы избежать неприятностей"),
    Question("Бывает, что я проявляю интерес к запретным темам"),
    Question("У меня часто бывают приступы плохого настроения"),
    Question("Мои друзья поражаются моей работоспособности и неутомимости"),
    Question("Я человек чувствительный и возбудимый"),
    Question("Все проблемы в жизни разрешимы"),
    Question("У меня бывают приступы дрожи"),
    Question("Я люблю рассказывать анекдоты и веселые истории"),
    Question("Временами мне хотелось навсегда уйти из дома"),
    Question("Я часто волнуюсь из-за пустяков"),
    Question("В свое оправдание я иногда кое-что выдумываю"),
    Question("Иногда вдруг весь покрываюсь потом"),
    Question("Бывает, что я не выполняю своих обещаний"),
    Question("Порой мне кажется, что я не на что не гожусь"),
    Question("Не все мои знакомые мне нравятся"),
    Question("Часто у меня нет аппетита"),
    Question("Легко могу развеселить самую скучную компанию"),
    Question("Привычки некоторых членов семьи меня раздражают"),
    Question("Я легко нахожу тему для разговора даже с незнакомым человеком"),
    Question(
        "Мне кажется, что я постоянно нахожусь в каком-то напряжении и мне трудно расслабиться"),
    Question("Часто мне хочется умереть"),
    Question("Меня считают человеком веселым и общительным"),
    Question("Я все принимаю близко к сердцу"),
    Question(
        "У меня часто возникают боли «под ложечкой» и различные неприятные ощущения в животе"),
    Question("Я всегда готов поговорить и со знакомыми и с незнакомыми"),
    Question(
        "Если я чем-то сильно взволнован или раздражен, то чувствую это как бы всем телом"),
    Question("Я много мечтаю, но никому об этом не говорю"),
    Question(
        "Иногда я полон энергии так, что все горит в моих руках, а иногда - совсем вялый"),
    Question("Я не всегда говорю правду"),
    Question("На спор я могу сделать все, что угодно"),
    Question(
        "Я так остро переживаю неприятности, что долго не могу выкинуть из головы мысли об этом"),
    Question("Я часто чувствую себя вялым и усталым"),
    Question("Я люблю подшучивать над другими"),
    Question("Критика и замечания всегда очень задевают меня"),
    Question("Мне часто снятся кошмары"),
    Question("Я способен дать волю чувствам и повеселиться в компании"),
    Question("Иногда без видимой причины чувствую себя вялым и подавленным"),
    Question("У меня часто бывает бессонница"),
    Question(" Иногда я передаю слухи и сплетни"),
    Question("Я ко всему отношусь достаточно легко"),
    Question(
        "Почти ежедневно думаю о том, насколько бы я лучше жил, если бы меня преследовали неудачи"),
    Question("Я — уверенный в себе человек"),
    Question(" Меня часто беспокоит чувство вины"),
    Question("Я хожу быстро"),
    Question("Нередко бывают ситуации, когда легко потерять надежду на успех"),
    Question(
        "Часто мне не спиться из-за того, что в голову лезут разные мысли"),
    Question("Мне кажется, что другие часто смеются надо мной"),
    Question("Я — человек беспечный"),
    Question("Иногда у меня бывают такие мысли, которых нужно стыдиться"),
    Question("У меня часто бывают сильные сердцебиения"),
    Question("Даже среди людей я чувствую себя одиноким"),
    Question("Иногда я много говорю и мне трудно остановиться"),
    Question(
        "Я постоянно нуждаюсь в друзьях, которые меня понимают, могут ободрить, утешить"),
    Question(
        "Иногда я отказываюсь от начатого дела, так как не верю в свои силы"),
    Question(
        "У меня бывают периоды, когда меня сильно раздражают яркий свет, яркие краски, сильный шум, хотя на других людей это так не действует"),
    Question("У меня есть плохие привычки"),
  ];

  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;
  int counter4 = 0;
  final Map<int, String> _selectedAnswers = {};
  int currentIndex = 0;

  void _answerQuestion(String? value) {
    setState(() {
      _selectedAnswers[currentIndex] = value!;
      if (currentIndex == 3 ||
          currentIndex == 12 ||
          currentIndex == 19 ||
          currentIndex == 28 ||
          currentIndex == 30 ||
          currentIndex == 32 ||
          currentIndex == 46 ||
          currentIndex == 56 ||
          currentIndex == 66 ||
          currentIndex == 73) {
        if (value == 'Yes') {
          counter1++;
        }
      } else if (currentIndex == 1 ||
          currentIndex == 5 ||
          currentIndex == 11 ||
          currentIndex == 13 ||
          currentIndex == 18 ||
          currentIndex == 20 ||
          currentIndex == 26 ||
          currentIndex == 27 ||
          currentIndex == 31 ||
          currentIndex == 35 ||
          currentIndex == 38 ||
          currentIndex == 40 ||
          currentIndex == 44 ||
          currentIndex == 48 ||
          currentIndex == 51 ||
          currentIndex == 54 ||
          currentIndex == 58 ||
          currentIndex == 62 ||
          currentIndex == 64 ||
          currentIndex == 68 ||
          currentIndex == 71) {
        if (value == 'Yes') {
          counter2++;
        }
      } else if (currentIndex == 2 ||
          currentIndex == 7 ||
          currentIndex == 9 ||
          currentIndex == 15 ||
          currentIndex == 17 ||
          currentIndex == 22 ||
          currentIndex == 24 ||
          currentIndex == 29 ||
          currentIndex == 33 ||
          currentIndex == 37 ||
          currentIndex == 41 ||
          currentIndex == 43 ||
          currentIndex == 45 ||
          currentIndex == 49 ||
          currentIndex == 52 ||
          currentIndex == 55 ||
          currentIndex == 60 ||
          currentIndex == 63 ||
          currentIndex == 67 ||
          currentIndex == 70 ||
          currentIndex == 72) {
        if (value == 'Yes') {
          counter3++;
        }
      } else if (currentIndex == 4 ||
          currentIndex == 6 ||
          currentIndex == 8 ||
          currentIndex == 10 ||
          currentIndex == 14 ||
          currentIndex == 16 ||
          currentIndex == 21 ||
          currentIndex == 23 ||
          currentIndex == 25 ||
          currentIndex == 34 ||
          currentIndex == 36 ||
          currentIndex == 39 ||
          currentIndex == 42 ||
          currentIndex == 47 ||
          currentIndex == 50 ||
          currentIndex == 53 ||
          currentIndex == 57 ||
          currentIndex == 59 ||
          currentIndex == 61 ||
          currentIndex == 65 ||
          currentIndex == 69) {
        if (value == 'Yes') {
          counter4++;
        }
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      currentIndex++;
    });
  }

  void _submitTest() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Answer Counts'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('шкала искренности: $counter1'),
              Text('шкала депрессивности: $counter2'),
              Text('шкала невротизации: $counter3'),
              Text('шкала общительности: $counter4'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psychology Test'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                return Visibility(
                  visible: currentIndex == index,
                  child: ListTile(
                    title: Text(_questions[index].questionText),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RadioListTile<String>(
                          title: const Text('Да'),
                          value: 'Yes',
                          groupValue: _selectedAnswers[index],
                          onChanged: _answerQuestion,
                        ),
                        RadioListTile<String>(
                          title: const Text('Нет'),
                          value: 'No',
                          groupValue: _selectedAnswers[index],
                          onChanged: _answerQuestion,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (currentIndex != _questions.length - 1)
            ElevatedButton(
              onPressed: () {
                if (_selectedAnswers[currentIndex] != null) {
                  _nextQuestion();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Выберите один вариант'),
                    ),
                  );
                }
              },
              child: const Text('Следующий'),
            )
          else
            ElevatedButton(
              onPressed: () {
                if (_selectedAnswers[currentIndex] != null) {
                  _submitTest();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Выберите один вариант'),
                    ),
                  );
                }
              },
              child: const Text('Закончить тест'),
            ),
        ],
      ),
    );
  }
}

class Question {
  final String questionText;

  Question(this.questionText);
}
