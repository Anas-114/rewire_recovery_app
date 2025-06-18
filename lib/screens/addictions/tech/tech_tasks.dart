import 'package:flutter/material.dart';

class TechTasks extends StatelessWidget {
  const TechTasks({super.key});

  final List<String> tasks = const [
    "📵 No screen 1 hour before bed",
    "📴 Phone-free lunch",
    "🧘 2 hours digital detox today",
    "📖 Read 10 pages from a book",
    "🚶‍♂️ 20 min outdoor walk, no phone"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: const Icon(Icons.check_circle_outline),
          title: Text(tasks[index]),
        ),
      ),
    );
  }
}
