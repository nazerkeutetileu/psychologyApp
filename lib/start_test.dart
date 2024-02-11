import 'package:flutter/material.dart';
import 'package:psycho/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NameInputPage(),
    );
  }
}

class NameInputPage extends StatefulWidget {
  @override
  _NameInputPageState createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {
  TextEditingController _nameController = TextEditingController();
  bool _isReady = false;
  bool _isChecked = false;
  bool _isNextClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тест'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Ваше имя',
              ),
              onChanged: (value) {
                setState(() {
                  // Enable the button if the name is not empty
                  _isReady = value.isNotEmpty;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isNextClicked = true;
                });
              },
              child: Text('Дальше'),
            ),
            if (_isNextClicked && _isReady) ...[
              SizedBox(height: 20),
              Text(
                'Представьте себе, что все услышанное вами далее сказано от вашего имени человеком, который давно и хорошо вас знает. Кое-что из сказанного верно, подходит к вам, а кое-что — не верно, то есть вы с этим утверждением не согласны. Нажмите "Да" если вы согласны и  "Нет" если это утверждение не про вас. Не старайтесь долго рассуждать. Обычно то, что в начале приходит в голову и является наиболее точным ответом',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Text('Я хорошо прочитал всю инструкцию и готов к тесту !'),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _isChecked
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuizApp(),
                          ),
                        );
                      }
                    : null,
                child: Text('Дальше'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
