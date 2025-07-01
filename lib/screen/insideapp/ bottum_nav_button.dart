import 'package:flutter/material.dart';
import 'package:recover/screen/insideapp/datas/pie_chart_widget.dart';
import 'package:recover/screen/insideapp/home_screen.dart';
import 'package:recover/screen/insideapp/progresson.dart';
import 'package:recover/screen/insideapp/taskd.dart';

class BottomNavBarScreen extends StatefulWidget {
  final String selectedAddiction;
  const BottomNavBarScreen({super.key, required this.selectedAddiction});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentindex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomeScreen(selectedAddiction: widget.selectedAddiction),
      Taskd(),
      Progresson(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent.shade200,
        unselectedItemColor: Colors.indigo,
        currentIndex: currentindex,
        onTap: (index) {
          setState(() => currentindex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_rounded),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline_rounded),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}
