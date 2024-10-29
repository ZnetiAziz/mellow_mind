import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';

class UserPage extends StatelessWidget {
  final String username;
  final String email; // Add email parameter

  const UserPage({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/imm2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Main content with transparent container (optional)
          SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
            child: Column(
              children: [
                // Add user profile and settings here (replace with your actual implementation)
                // ...

                // Back button
                Positioned(
                  top: 40.0,
                  left: 10.0,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomePage(username: username),
                        ),
                      );
                    },
                    label: const Text(''),
                    icon: const Icon(Icons.arrow_back),
                    backgroundColor: const Color(0xFFB3E5FC),
                    shape: const StadiumBorder(), // Rounded shape
                  ),
                ),

                const SizedBox(height: 40), // Spacing

                // Circular area for user information
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10.0,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'User Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Username: $username',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Email: $email',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
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
