import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:psycho/routing/app_routes.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Инструкция',
          style: TextStyle(
            fontSize: 23,
            color: Color(0xFF7CBCA0),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'instructionImage', // Уникальный тег для анимации Hero
              child: SizedBox(
                height: 276,
                width: 276,
                child: Lottie.network(
                    'https://lottie.host/acfa9f93-43cc-4b23-980f-10a914ead78b/G7fQZHUV9T.json'),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '"Личный опросник ИСН – ориентировочная методика для выявления суицидально опасных установок у подростков 13-18 лет, но может применяться и для обследования взрослых. Опросник предназначен для выявления депрессивного и невротического состояний, а также уровня общительности."',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add_alert_sharp,
                    size: 15,
                    color: Colors.orangeAccent,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Внимательно прочитайте 74 утверждений и оцените, согласны ли вы с ними.',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add_alert_sharp,
                    size: 15,
                    color: Colors.orangeAccent,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Используйте ответы: «+», «-»',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.quizPage);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(
                    0xFF7CBCA0), // Заменяем зеленый на указанный цвет
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text('Сдать тест'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Назад'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
