import 'package:flutter/material.dart';

class TechRecoveryTips extends StatelessWidget {
  const TechRecoveryTips({super.key});

  final List<String> tips = const [
    "🧘 Practice mindfulness every morning",
    "📖 Replace social media time with reading",
    "💬 Talk to a friend instead of scrolling",
    "☀️ Start your day without your phone",
    "🚨 Turn off non-essential notifications"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tips.length,
      itemBuilder: (context, index) => Card(
        color: Colors.lightBlue.shade50,
        child: ListTile(
          leading: const Icon(Icons.tips_and_updates),
          title: Text(
            tips[index],
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
