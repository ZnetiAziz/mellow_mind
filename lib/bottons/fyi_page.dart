import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottons/ChatBotPage.dart';
import 'package:flutter_application_1/bottons/Userpage.dart';
import 'package:flutter_application_1/bottons/reminders_page.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';

class FYIPage extends StatelessWidget {
  final String username;

  const FYIPage({super.key, required this.username});

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
              child: Stack(
                children: [
                  // Title and main content
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50.0, horizontal: 16.0),
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              'For Your Information',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF32486A),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),

                          // White container with rounded edges
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.6),
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10.0,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Text(
                              'What is Depression?\n'
                              'Depression is more than just feeling sad or experiencing a low mood. '
                              'It is a persistent feeling of sadness or loss of interest that can interfere '
                              'with daily functioning. It can lead to emotional and physical problems and '
                              'can diminish the quality of life.\n\n'
                              'Types of Depression\n'
                              'Major Depressive Disorder (MDD): Characterized by a persistent feeling of sadness '
                              'or a lack of interest in outside stimuli. Symptoms can interfere with daily life.\n\n'
                              'Persistent Depressive Disorder (Dysthymia): A chronic form of depression where a person '
                              'may experience a low mood for at least two years.\n\n'
                              'Bipolar Disorder: Involves periods of depression alternating with periods of mania or hypomania.\n\n'
                              'Seasonal Affective Disorder (SAD): A type of depression that occurs at certain times of '
                              'the year, usually in the winter months when sunlight exposure is reduced.\n\n'
                              'Postpartum Depression: A type of depression that occurs after childbirth, affecting mothers '
                              'after delivery.\n\n'
                              'Psychotic Depression: A severe form of depression that includes some form of psychosis, '
                              'such as hallucinations or delusions.\n\n'
                              'Causes of Depression\n'
                              'The exact cause of depression is not fully understood, but it is believed to be a combination '
                              'of genetic, biological, environmental, and psychological factors:\n\n'
                              'Genetics: A family history of depression can increase the risk. Certain genetic traits may '
                              'make individuals more susceptible to depression.\n\n'
                              'Biochemistry: Imbalances in neurotransmitters (brain chemicals) such as serotonin, dopamine, '
                              'and norepinephrine can play a significant role.\n\n'
                              'Hormonal Changes: Hormonal fluctuations, especially during events like puberty, pregnancy, '
                              'postpartum, menopause, or thyroid problems, can trigger depression.\n\n'
                              'Life Events: Stressful life events, such as the death of a loved one, divorce, job loss, or '
                              'trauma, can lead to depression.\n\n'
                              'Medical Conditions: Chronic illnesses, certain medications, and substance abuse can contribute '
                              'to depressive symptoms.\n\n'
                              'Personality Traits: Individuals with low self-esteem, pessimism, or high levels of stress may '
                              'be more susceptible to depression.\n\n'
                              'Environmental Factors: Factors such as poverty, isolation, and lack of social support can also '
                              'increase the risk of developing depression.\n\n'
                              'Symptoms of Depression\n'
                              'Symptoms can vary widely, but they often include:\n'
                              '- Persistent sadness or low mood\n'
                              '- Loss of interest or pleasure in activities once enjoyed\n'
                              '- Changes in appetite or weight (either weight loss or gain)\n'
                              '- Sleep disturbances (insomnia or excessive sleeping)\n'
                              '- Fatigue or loss of energy\n'
                              '- Feelings of worthlessness or guilt\n'
                              '- Difficulty concentrating, making decisions, or remembering things\n'
                              '- Psychomotor agitation or retardation (restlessness or slowed movements)\n'
                              '- Thoughts of death or suicide\n\n'
                              'Diagnosis of Depression\n'
                              'Diagnosis typically involves several steps, including:\n\n'
                              'Clinical Interview: A mental health professional conducts a thorough assessment, which includes '
                              'discussing symptoms, duration, and impact on daily life.\n\n'
                              'Diagnostic Criteria: The diagnosis is often made using criteria from the DSM-5 (Diagnostic and '
                              'Statistical Manual of Mental Disorders, Fifth Edition) or ICD-10 (International Classification '
                              'of Diseases). According to the DSM-5, at least five of the following symptoms must be present for '
                              'at least two weeks:\n\n'
                              '- Depressed mood most of the day\n'
                              '- Diminished interest or pleasure in activities\n'
                              '- Significant weight loss or gain, or decrease or increase in appetite\n'
                              '- Insomnia or hypersomnia\n'
                              '- Psychomotor agitation or retardation\n'
                              '- Fatigue or loss of energy\n'
                              '- Feelings of worthlessness or excessive guilt\n'
                              '- Diminished ability to think or concentrate\n'
                              '- Recurrent thoughts of death or suicidal ideation\n\n'
                              'Physical Examination: A healthcare provider may perform a physical exam to rule out other '
                              'medical conditions that could be causing symptoms, such as thyroid disorders.\n\n'
                              'Questionnaires and Self-Report Tools: Various standardized screening tools, like the Patient '
                              'Health Questionnaire (PHQ-9) or Beck Depression Inventory, can be used to assess the severity of '
                              'depression.\n\n'
                              'Treatment Options\n'
                              'Treatment for depression can include:\n\n'
                              '- Psychotherapy: Cognitive Behavioral Therapy (CBT), interpersonal therapy, and other types of '
                              'talk therapy can help individuals manage symptoms.\n'
                              '- Medications: Antidepressants, such as selective serotonin reuptake inhibitors (SSRIs) and '
                              'serotonin-norepinephrine reuptake inhibitors (SNRIs), are often prescribed.\n'
                              '- Lifestyle Changes: Regular exercise, healthy eating, adequate sleep, and social support can '
                              'significantly impact mood and overall mental health.\n'
                              '- Alternative Therapies: Mindfulness, yoga, acupuncture, and supplements (such as omega-3 fatty '
                              'acids or St. John’s Wort) may also be beneficial for some individuals.\n'
                              '- Hospitalization: In severe cases, hospitalization may be necessary, especially if there is a '
                              'risk of self-harm or suicide.\n\n',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                  icon: const Icon(Icons.chat, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatBotPage(username: username),
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
