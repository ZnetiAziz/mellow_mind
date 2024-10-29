import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';

class RemindersPage extends StatelessWidget {
  final String username;
  const RemindersPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/imm2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // "Back to Welcome" button at top left
            Positioned(
              top: 40.0,
              left: 20.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(username: username),
                    ),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFB3E5FC), // Blue pastel circle
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Title and main content
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF32486A)),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                        // ... your reminders content here
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
