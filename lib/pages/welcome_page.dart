import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/bottons/quiz_page.dart'; // Import QuizPage
import 'package:flutter_application_1/bottons/ChatBotPage.dart'; // Import ChatbotPage
import 'package:flutter_application_1/bottons/emergency_page.dart'; // Import EmergencyPage
import 'package:flutter_application_1/bottons/reminders_page.dart'; // Import RemindersPage
import 'package:flutter_application_1/bottons/fyi_page.dart'; // Import FYIPage

class WelcomePage extends StatelessWidget {
  final String username;

  const WelcomePage({super.key, required this.username});

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
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200.0, left: 50.0),
                  child: Text(
                    'Welcome Back, $username !',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF32486A),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.6),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Quiz Button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QuizPage(username: username),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.pink[300],
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text('Quiz'),
                          ),
                          const SizedBox(height: 20.0),

                          // Chat Button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChatBotPage(username: username),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.pink[300],
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text('My Chat'),
                          ),
                          const SizedBox(height: 20.0),

                          // Emergency Button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmergencyPage(
                                    username: username,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.pink[300],
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text('Contact My Doctor'),
                          ),
                          const SizedBox(height: 20.0),

                          // Notifications Button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RemindersPage(username: username),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.pink[300],
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text('Notifications'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // FYI Button on Bottom Left
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FYIPage(username: username),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF82DDF9),
                ),
                child: const Text('FYI'),
              ),
            ),
            // Logout Button on Bottom Right
            Positioned(
              right: 20.0,
              bottom: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF82DDF9),
                ),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
