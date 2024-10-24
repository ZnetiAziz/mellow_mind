import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await AuthService.login(
                    emailController.text, passwordController.text);
                if (success) {
                  // Get the username from AuthService (assuming you store it after login)
                  String username = await AuthService.getUsernameByEmail(
                      emailController.text);

                  // Navigate to WelcomePage and pass the username
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(username: username),
                    ),
                  );
                } else {
                  print('Invalid credentials');
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
