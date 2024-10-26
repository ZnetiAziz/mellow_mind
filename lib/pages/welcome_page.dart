import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/bottons/quiz_page.dart'; // Import QuizPage
import 'package:flutter_application_1/bottons/chatbot_page.dart'; // Import ChatbotPage
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
            image: AssetImage('assets/images/im3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Column to hold the welcome text and buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Text
                Padding(
                  padding: const EdgeInsets.only(top: 150.0, left: 100.0),
                  child: Text(
                    'Welcome, $username',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF32486A),
                    ),
                  ),
                ),
                // White area for buttons
                Expanded(
                  // Use Expanded to fill the remaining space
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal:
                              20.0), // Margin to ensure it doesn’t touch the edges
                      width: MediaQuery.of(context).size.width *
                          1, // Set width to 80% of the screen width
                      height: MediaQuery.of(context).size.height *
                          0.4, // Set height to 60% of the screen height
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(
                            255, 255, 255, 0.6), // 60% opacity
                        borderRadius:
                            BorderRadius.circular(20.0), // Rounded corners
                      ),
                      padding: const EdgeInsets.all(
                          20.0), // Padding inside the container
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.start, // Align buttons at the top
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align buttons to the left
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuizPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.pink[300],
                              minimumSize: const Size(double.infinity,
                                  50), // Full width and height of 50
                            ),
                            child: const Text('Quiz'),
                          ),
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChatbotPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.pink[300],
                              minimumSize: const Size(double.infinity,
                                  50), // Full width and height of 50
                            ),
                            child: const Text('Chat'),
                          ),
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmergencyPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.pink[300],
                              minimumSize: const Size(double.infinity,
                                  50), // Full width and height of 50
                            ),
                            child: const Text('Contact My Doctor'),
                          ),
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RemindersPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.pink[300],
                              minimumSize: const Size(double.infinity,
                                  50), // Full width and height of 50
                            ),
                            child: const Text('Notification'),
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
                      builder: (context) => const FYIPage(),
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
