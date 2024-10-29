import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

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
                      builder: (context) => const WelcomePage(
                          username:
                              'User'), // Replace 'User' with the actual username if needed
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
                      'Contact My Doctor',
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF32486A)),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                        // ... your emergency contact content here
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
