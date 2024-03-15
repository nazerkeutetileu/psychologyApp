import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psycho/services/auth_service.dart';

import '../models/user_model.dart';
import '../routing/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              User? user = await authService.signInWithEmailAndPassword(
                emailController.text,
                passwordController.text,
              );
              if (user != null) {
                Navigator.pushNamed(context, AppRoutes.startTestPage);
              } else {}
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
