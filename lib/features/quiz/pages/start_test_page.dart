import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psycho/providers/test_initiation_provider.dart';
import 'package:psycho/routing/app_routes.dart';

class StartTestPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  StartTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final testInitiation =
        Provider.of<TestInitiationProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Тест'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              onChanged: (value) {
                testInitiation.setReady(value.isNotEmpty);
              },
              decoration: const InputDecoration(
                labelText: 'Ваше имя',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Представьте себе, что все услышанное вами далее сказано от вашего имени человеком, который давно и хорошо вас знает. Кое-что из сказанного верно, подходит к вам, а кое-что — не верно, то есть вы с этим утверждением не согласны. Нажмите "Да" если вы согласны и  "Нет" если это утверждение не про вас. Не старайтесь долго рассуждать. Обычно то, что в начале приходит в голову и является наиболее точным ответом',
              textAlign: TextAlign.center,
            ),
            Consumer<TestInitiationProvider>(
              builder: (context, data, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: data.isChecked,
                      onChanged: (value) {
                        testInitiation.setIsChecked(value ?? false);
                      },
                    ),
                    const Text(
                      'Я хорошо прочитал всю инструкцию и готов к тесту !',
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (testInitiation.isChecked) {
                  Navigator.pushNamed(context, AppRoutes.quizPage);
                }
              },
              child: const Text('Дальше'),
            ),
          ],
        ),
      ),
    );
  }
}
