import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/services/user_manager.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController menstrualCycleDateController =
      TextEditingController();
  final UserManager userManager;

  String? gender;
  String? civilStatus;

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
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(16.0),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    TextField(
                      controller: confirmPasswordController,
                      decoration:
                          const InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                    ),
                    TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Age'),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Gender'),
                      value: gender,
                      items: const [
                        DropdownMenuItem(value: 'Male', child: Text('Male')),
                        DropdownMenuItem(
                            value: 'Female', child: Text('Female')),
                        DropdownMenuItem(value: 'Other', child: Text('Other')),
                      ],
                      onChanged: (value) {
                        gender = value;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      decoration:
                          const InputDecoration(labelText: 'Civil Status'),
                      value: civilStatus,
                      items: const [
                        DropdownMenuItem(
                            value: 'Single', child: Text('Single')),
                        DropdownMenuItem(
                            value: 'Married', child: Text('Married')),
                        DropdownMenuItem(
                            value: 'Divorced', child: Text('Divorced')),
                        DropdownMenuItem(
                            value: 'Widowed', child: Text('Widowed')),
                      ],
                      onChanged: (value) {
                        civilStatus = value;
                      },
                    ),
                    if (gender == 'Female') // Show only if Female is selected
                      TextField(
                        controller: menstrualCycleDateController,
                        readOnly:
                            true, // Make it read-only to prevent manual input
                        decoration: const InputDecoration(
                          labelText: 'Date of Last Menstrual Cycle',
                          hintText: 'Select a date',
                        ),
                        onTap: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (selectedDate != null) {
                            menstrualCycleDateController.text =
                                "${selectedDate.toLocal()}"
                                    .split(' ')[0]; // Format to YYYY-MM-DD
                          }
                        },
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
                          int? age = int.tryParse(ageController.text);
                          if (age != null) {
                            bool success = userManager.signup(
                              usernameController.text,
                              emailController.text,
                              passwordController.text,
                              gender!,
                              civilStatus!,
                              age,
                            );
                            if (success) {
                              print('Signup successful');
                              Navigator.pop(context);
                            } else {
                              print('Error during signup');
                            }
                          } else {
                            print('Please enter a valid age');
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
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: const Text(
              'Nice to meet you!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 45, 89, 125),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
