import 'package:flutter/material.dart';
import 'package:recoverly/screens/addictions/tech/tech_home.dart';
import 'package:recoverly/screens/addictions/tech/tech_progress.dart';
import 'package:recoverly/screens/addictions/tech/tech_recovery.dart';
import 'package:recoverly/screens/addictions/tech/tech_tasks.dart';
import 'package:recoverly/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/screens/login_page.dart'; // ✅ Change if your login screen is different

class Bottum extends StatefulWidget {
  const Bottum({super.key});

  @override
  State<Bottum> createState() => _BottumState();
}

class _BottumState extends State<Bottum> {
  int gort = 0;

  final List<Widget> pages = [
    TechAddictionHome(),
    TechTasks(),
    TechProgress(),
    TechRecoveryTips(),
  ];

  Future<void> _logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.remove('addiction');

     
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              Navigator.pop(context);
              _logout();
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tech Addiction Recovery",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF31ACDD),
        elevation: 6,
        shadowColor: Colors.deepPurple.shade200,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: _confirmLogout,
          tooltip: 'Logout',
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
      ),
      body: pages[gort],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: gort,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey[600],
        onTap: (value) {
          setState(() {
            gort = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.self_improvement), label: 'Recovery'),
        ],
      ),
    );
  }
}
