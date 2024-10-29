// signup_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final UserManager userManager;

  SignupPage({super.key, required this.userManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/imm1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromRGBO(255, 255, 255, 0.6), // 60% opacity
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                          controller: usernameController,
                          decoration:
                              const InputDecoration(labelText: 'Username'),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                        ),
                        TextField(
                          controller: passwordController,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        TextField(
                          controller: confirmPasswordController,
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password'),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.pink[300],
                          ),
                          onPressed: () {
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              bool success = userManager.signup(
                                  usernameController.text,
                                  emailController.text,
                                  passwordController.text);
                              if (success) {
                                print('Signup successful');
                                Navigator.pop(context);
                              } else {
                                print('Error during signup');
                              }
                            } else {
                              print('Passwords do not match');
                            }
                          },
                          child: const Text('Sign Up'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Already have an account? Login'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nice to meet you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 45, 89, 125),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
