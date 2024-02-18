import 'package:flutter/material.dart';
import 'package:psycho/pages/quiz_page.dart';
import 'package:psycho/pages/start_test_page.dart';
import 'package:psycho/pages/test_result_page.dart';
import 'package:psycho/routing/app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => MaterialApp());
      case AppRoutes.quizPage:
        return MaterialPageRoute(builder: (_) => const QuizPage());
      case AppRoutes.startTestPage:
        return MaterialPageRoute(builder: (_) => StartTestPage());
      case AppRoutes.testResultPage:
        // If args is not of the correct type, return an error page.
        if (args is! TestResultPage) {
          return _errorRoute();
        }
        // Extract arguments and pass to the page constructor.
        final TestResultPage testResultArgs = args;
        return MaterialPageRoute(
          builder: (_) => TestResultPage(
            counter1: testResultArgs.counter1,
            counter2: testResultArgs.counter2,
            counter3: testResultArgs.counter3,
            counter4: testResultArgs.counter4,
          ),
        );
      default:
        // If there is no such named route, return an error page.
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error: Unknown Route'),
        ),
      );
    });
  }
}
