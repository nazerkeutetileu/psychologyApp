import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

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
  const QuizScreen({super.key});

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

    // Add more questions here
  ];

  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;
  int counter4 = 0;
  final Map<int, String> _selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psychology Test'),
      ),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_questions[index].questionText),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile<String>(
                  title: const Text('Да'),
                  value: 'Yes',
                  groupValue: _selectedAnswers[index],
                  onChanged: (value) {
                    setState(() {
                      _selectedAnswers[index] = value!;
                      if (index == 4 ||
                          index == 13 ||
                          index == 20 ||
                          index == 29 ||
                          index == 31 ||
                          index == 33 ||
                          index == 47 ||
                          index == 57 ||
                          index == 67 ||
                          index == 74) {
                        if (value == 'Yes') {
                          counter1++;
                        }
                      } else if (index == 2 ||
                          index == 6 ||
                          index == 12 ||
                          index == 14 ||
                          index == 19 ||
                          index == 21 ||
                          index == 27 ||
                          index == 28 ||
                          index == 32 ||
                          index == 36 ||
                          index == 39 ||
                          index == 41 ||
                          index == 45 ||
                          index == 49 ||
                          index == 52 ||
                          index == 55 ||
                          index == 59 ||
                          index == 63 ||
                          index == 65 ||
                          index == 69 ||
                          index == 72) {
                        if (value == 'Yes') {
                          counter2++;
                        }
                      } else if (index == 2 ||
                          index == 3 ||
                          index == 8 ||
                          index == 10 ||
                          index == 16 ||
                          index == 18 ||
                          index == 23 ||
                          index == 25 ||
                          index == 30 ||
                          index == 34 ||
                          index == 38 ||
                          index == 42 ||
                          index == 44 ||
                          index == 46 ||
                          index == 50 ||
                          index == 53 ||
                          index == 56 ||
                          index == 61 ||
                          index == 64 ||
                          index == 68 ||
                          index == 71 ||
                          index == 73) {
                        if (value == 'Yes') {
                          counter3++;
                        } //5, 7, 9, 11, 15, 17, 22, 24,  26, 35, 37, 40, 43, 48, 51, 54, 58, 60, 62, 66, 70.
                      } else if (index == 5 ||
                          index == 7 ||
                          index == 9 ||
                          index == 11 ||
                          index == 15 ||
                          index == 17 ||
                          index == 22 ||
                          index == 24 ||
                          index == 26 ||
                          index == 35 ||
                          index == 37 ||
                          index == 40 ||
                          index == 43 ||
                          index == 48 ||
                          index == 51 ||
                          index == 54 ||
                          index == 58 ||
                          index == 60 ||
                          index == 62 ||
                          index == 66 ||
                          index == 70) {
                        if (value == 'Yes') {
                          counter4++;
                        }
                      }
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Нет'),
                  value: 'No',
                  groupValue: _selectedAnswers[index],
                  onChanged: (value) {
                    setState(() {
                      _selectedAnswers[index] = value!;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show answer counts
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
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

class Question {
  final String questionText;

  Question(this.questionText);
}
