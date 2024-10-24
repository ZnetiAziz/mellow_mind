import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  final String username; // Use the username now

  WelcomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome, $username',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to LoginPage on logout
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
