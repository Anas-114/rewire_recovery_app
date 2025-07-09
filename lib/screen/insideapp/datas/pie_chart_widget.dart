import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// Update the import path below to the correct location of type_model.dart in your project.
// For example, if type_model.dart is in lib/models/, use:
import 'package:recoverly/models/type_model.dart';

class MyPieChart extends StatefulWidget {
  const MyPieChart({super.key});

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
  @override
  Widget build(BuildContext context) {
    final taskBox = Hive.box<TypeModel>('taskBox');
    final tasks = taskBox.values.toList();

    int totalTasks = tasks.length;
    int doneTasks = tasks.where((task) => task.isDone).length;
    int leftTasks = totalTasks - doneTasks;

    if (totalTasks == 0) {
      return const Center(child: Text("No tasks available yet."));
    }

    final List<PieChartSectionData> sections = [
     
      PieChartSectionData(
        value: leftTasks.toDouble(),
        title: '${((leftTasks / totalTasks) * 100).toStringAsFixed(1)}%',
        color: Colors.redAccent,
        radius: 100,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      PieChartSectionData(
        value: doneTasks.toDouble(),
        title: '${((doneTasks / totalTasks) * 100).toStringAsFixed(1)}%',
        color: Colors.green,
        radius: 100,
        titleStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      PieChartSectionData(
        value: leftTasks.toDouble(),
        title: '${((leftTasks / totalTasks) * 100).toStringAsFixed(1)}%',
        color: const Color.fromARGB(255, 229, 255, 82),
        radius: 100,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
   
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        Text("🟢 Tasks Done: $doneTasks", style: const TextStyle(fontSize: 16)),
        Text("🔴 Tasks Left: $leftTasks", style: const TextStyle(fontSize: 16)),
        Text(
          "have to recover: 🟡",
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 270,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  centerSpaceRadius: 50,
                  sectionsSpace: 4,
                  borderData: FlBorderData(show: false),
                  sections: sections,
                ),
              ),
              const Text(
                "Task Stats",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
