import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottons/Userpage.dart';
import 'package:flutter_application_1/bottons/fyi_page.dart';
import 'package:flutter_application_1/bottons/reminders_page.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';

class QuizPage extends StatelessWidget {
  final String username;

  const QuizPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/imm2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Center(
                        child: Text(
                          'Quiz',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF32486A),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                            // Add your quiz content here
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Bottom navigation bar with gradient and circular icons
          Container(
            height: 70,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFB3E5FC), Color.fromARGB(255, 255, 81, 13)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomePage(username: username),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.help_outline, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FYIPage(username: username),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RemindersPage(username: username),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(
                          username: username,
                          email: '',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
