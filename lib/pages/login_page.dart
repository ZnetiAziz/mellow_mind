import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/im3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Make all children take full width
            children: <Widget>[
              const Spacer(), // Pushes content down
              const Text(
                'Happy to see you again !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28, // Larger size
                  fontWeight: FontWeight.bold, // Bold text
                  color: Color(0xFF32486A), // Black text color
                ),
              ),
              const SizedBox(height: 30), // Space between text and fields
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  filled: true, // Fill the box
                  fillColor: Colors.transparent, // Light gray background
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(10)), // Rounded edges
                    borderSide: BorderSide.none, // No border
                  ),
                  labelStyle: TextStyle(color: Colors.black), // Pastel color
                ),
              ),
              const SizedBox(height: 16), // Space between fields
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  filled: true, // Fill the box
                  fillColor: Colors.white, // Light gray background
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(10)), // Rounded edges
                    borderSide: BorderSide.none, // No border
                  ),
                  labelStyle: TextStyle(color: Colors.black), // Pastel color
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF9FEEAF),
                ),
                onPressed: () async {
                  bool success = await AuthService.login(
                      emailController.text, passwordController.text);
                  if (success) {
                    String username = await AuthService.getUsernameByEmail(
                        emailController.text);
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
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: const Text('Don\'t have an account? Sign up'),
              ),
              const SizedBox(height: 20), // Additional space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
