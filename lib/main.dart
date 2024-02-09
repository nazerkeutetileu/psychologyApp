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
    Question(1,
        "Я внимательно выслушал инструкцию и готов откровенно ответить на все вопросы"),
    Question(2,
        "Я часто легко отвлекаюсь от дела, становлюсь рассеянным и мечтательным"),
    Question(3, "Я устаю быстрее, чем большинство окружающих меня людей"),
    Question(4, "Иногда я могу похвастаться"),
    Question(5, "У меня часто бывает веселое настроение."),
    Question(6, "Меня часто одолевают грустные мысли"),
    Question(7, "Я люблю общение с людьми"),
    Question(8, "Нередко чувствую, что у меня немеют или холодеют руки и ноги"),
    Question(9, "Я быстро забываю об огорчениях"),
    Question(10, "Иногда ощущаю стук в висках и пульсацию в области шеи"),
    Question(11, "Я люблю развлекаться в веселой компании"),
    Question(12, "В моей семье есть нервные люди"),
    Question(13,
        "Бывает что я с уверенностью говорю о вещах, в которых слабо разбираюсь"),
    Question(14, "Временами чувствую себя беспомощным"),
    Question(15, "У меня много хороших знакомых"),
    Question(16, "У меня часто болит голова"),
    Question(17, "Я почти всегда подвижен и активен"),
    Question(18,
        "Если я сидел, а потом резко встал, то у меня темнеет в глазах и кружиться голова"),
    Question(19, "Иногда я ссылаюсь на болезнь, чтобы избежать неприятностей"),
    Question(20, "Бывает, что я проявляю интерес к запретным темам"),
    Question(21, "У меня часто бывают приступы плохого настроения"),
    Question(22, "Мои друзья поражаются моей работоспособности и неутомимости"),
    Question(23, "Я человек чувствительный и возбуждаемый"),
    Question(24, "Все проблемы в жизни разрешимы"),
    Question(25, "У меня бывают приступы дрожи"),
    Question(26, "Я люблю рассказывать анекдоты и веселые истории"),
    Question(27, "Временами мне хотелось навсегда уйти из дома"),
    Question(28, "Я часто волнуюсь из-за пустяков"),
    Question(29, "В свое оправдание я иногда кое-что выдумываю"),
    Question(30, "Иногда вдруг весь покрываюсь потом"),
    Question(31, "Бывает, что я не выполняю своих обещаний"),
    Question(32, "Порой мне кажется, что я не на что не гожусь"),
    Question(33, "Не все мои знакомые мне нравятся"),
    Question(34, "Часто у меня нет аппетита"),
    Question(35, "Легко могу развеселить самую скучную компанию"),
    Question(36, "Привычки некоторых членов семьи меня раздражают"),
    Question(
        37, "Я легко нахожу тему для разговора даже с незнакомым человеком"),
    Question(38,
        "Мне кажется, что я постоянно нахожусь в каком-то напряжении и мне трудно расслабиться"),
    Question(39, "Часто мне хочется умереть"),
    Question(40, "Меня считают человеком веселым и общительным"),
    Question(41, "Я все принимаю близко к сердцу"),
    Question(42,
        "У меня часто возникают боли «под ложечкой» и различные неприятные ощущения в животе"),
    Question(43, "Я всегда готов поговорить и со знакомыми и с незнакомыми"),
    Question(44,
        "Если я чем-то сильно взволнован или раздражен, то чувствую это как бы всем телом"),
    Question(45, "Я много мечтаю, но никому об этом не говорю"),
    Question(46,
        "Иногда я полон энергии так, что все горит в моих руках, а иногда - совсем вялый"),
    Question(47, "Я не всегда говорю правду"),
    Question(48, "На спор я могу сделать все, что угодно"),
    Question(49,
        "Я так остро переживаю неприятности, что долго не могу выкинуть из головы мысли об этом"),
    Question(50, "Я часто чувствую себя вялым и усталым"),
    Question(51, "Я люблю подшучивать над другими"),
    Question(52, "Критика и замечания всегда очень задевают меня"),
    Question(53, "Мне часто снятся кошмары"),
    Question(54, "Я способен дать волю чувствам и повеселиться в компании"),
    Question(
        55, "Иногда без видимой причины чувствую себя вялым и подавленным"),
    Question(56, "У меня часто бывает бессонница"),
    Question(57, "Иногда я передаю слухи и сплетни"),
    Question(58, "Я ко всему отношусь достаточно легко"),
    Question(59,
        "Почти ежедневно думаю о том, насколько бы я лучше жил, если бы меня преследовали неудачи"),
    Question(60, "Я — уверенный в себе человек"),
    Question(61, "Меня часто беспокоит чувство вины"),
    Question(62, "Я хожу быстро"),
    Question(
        63, "Нередко бывают ситуации, когда легко потерять надежду на успех"),
    Question(
        64, "Часто мне не спиться из-за того, что в голову лезут разные мысли"),
    Question(65, "Мне кажется, что другие часто смеются надо мной"),
    Question(66, "Я — человек беспечный"),
    Question(67, "Иногда у меня бывают такие мысли, которых нужно стыдиться"),
    Question(68, "У меня часто бывают сильные сердцебиения"),
    Question(69, "Даже среди людей я чувствую себя одиноким"),
    Question(70, "Иногда я много говорю и мне трудно остановиться"),
    Question(71,
        "Я постоянно нуждаюсь в друзьях, которые меня понимают, могут ободрить, утешить"),
    Question(72,
        "Иногда я отказываюсь от начатого дела, так как не верю в свои силы"),
    Question(73,
        "У меня бывают периоды, когда меня сильно раздражают яркий свет, яркие краски, сильный шум, хотя на других людей это так не действует"),
    Question(74, "У меня есть плохие привычки"),
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
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (currentIndex < _questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      _submitTest();
    }
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
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_questions[index].number}. ${_questions[index].questionText}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              _answerQuestion('Yes');
                            },
                            child: const Text('Да'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              _answerQuestion('No');
                            },
                            child: const Text('Нет'),
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
      ),
    );
  }
}

class Question {
  final int number;
  final String questionText;

  Question(this.number, this.questionText);
}
