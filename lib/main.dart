import 'package:flutter/material.dart';
import 'package:psycho/routing/app_routes.dart';
import 'package:psycho/routing/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Psycho Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.startTestPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
