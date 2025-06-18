import 'package:flutter/material.dart';

class TechProgress extends StatelessWidget {
  const TechProgress({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy progress data
    double progress = 0.6; // 60% of tasks completed

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Weekly Progress",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            CircularProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              strokeWidth: 8,
            ),
            const SizedBox(height: 20),
            Text("${(progress * 100).toInt()}% Completed"),
          ],
        ),
      ),
    );
  }
}
