import 'package:flutter/material.dart';

class TechAddictionHome extends StatefulWidget {
  const TechAddictionHome({super.key});

  @override
  State<TechAddictionHome> createState() => _TechAddictionHomeState();
}

class _TechAddictionHomeState extends State<TechAddictionHome> {
  final TextStyle headingStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );

  final TextStyle bodyStyle = const TextStyle(
    fontSize: 16,
    height: 1.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("What is Technology Addiction?", style: headingStyle),
            const SizedBox(height: 8),
            Text(
              "Excessive and compulsive use of the internet or online activities can lead to negative consequences in various aspects of life. This includes social media, gaming, gambling, online shopping, and pornography.",
              style: bodyStyle,
            ),
            const SizedBox(height: 16),

            Text("Types of Technology Addiction", style: headingStyle),
            const SizedBox(height: 8),
            Text(
              "• Social Media Addiction: Constantly checking and updating platforms, impacting real-world relationships.\n"
              "• Gaming Disorder: Overuse of games leading to neglect of responsibilities.\n"
              "• Online Gambling: Easy access increases risk of addiction.\n"
              "• Online Shopping Addiction: Impulsive and harmful spending.\n"
              "• Online Pornography: Compulsive use affecting relationships and well-being.",
              style: bodyStyle,
            ),
            const SizedBox(height: 16),

            Text("Who’s At Risk?", style: headingStyle),
            const SizedBox(height: 8),
            Text(
              "Children and teens are especially vulnerable due to brain development. Excessive social media and gaming can lead to anxiety, depression, and insomnia.",
              style: bodyStyle,
            ),
            const SizedBox(height: 16),

            Text("Symptoms", style: headingStyle),
            const SizedBox(height: 8),
            Text(
              "• Inability to control usage\n"
              "• Neglecting duties\n"
              "• Withdrawal symptoms when offline\n"
              "• Needing more screen time for same satisfaction\n"
              "• Physical issues: eye strain, sleep problems, headaches",
              style: bodyStyle,
            ),
            const SizedBox(height: 16),

            Text("Causes", style: headingStyle),
            const SizedBox(height: 8),
            Text(
              "• Mental health issues like anxiety or depression\n"
              "• Social isolation or peer pressure\n"
              "• Easy access via smartphones",
              style: bodyStyle,
            ),
            const SizedBox(height: 16),

            Text("Treatment & Prevention", style: headingStyle),
            const SizedBox(height: 8),
            Text(
              "• Cognitive Behavioral Therapy (CBT)\n"
              "• Mindfulness & Motivational Interviewing\n"
              "• Support groups and family therapy\n"
              "• In some cases, medication\n"
              "• Awareness campaigns for youth & parents",
              style: bodyStyle,
            ),
            const SizedBox(height: 16),

            Text("Healthy Social Media Use", style: headingStyle),
            const SizedBox(height: 8),
            Text(
              "• Stay positive & avoid toxic interactions\n"
              "• Limit screen time\n"
              "• Avoid doomscrolling\n"
              "• Be mindful of privacy & safety",
              style: bodyStyle,
            ),
            const SizedBox(height: 16),

            Text("Parenting Guidance", style: headingStyle),
            const SizedBox(height: 8),
            Text(
              "Balance: Mix online & offline time wisely\n"
              "Boundaries: What’s OK to share and when to use tech\n"
              "Communication: Open convos about tech habits",
              style: bodyStyle,
            ),
            const SizedBox(height: 24),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // You can navigate to task page or do something
                },
                icon: const Icon(Icons.arrow_forward_ios),
                label: const Text("Start Recovery Journey"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
