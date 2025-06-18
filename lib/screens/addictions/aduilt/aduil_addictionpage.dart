// Example pages
import 'package:flutter/material.dart';
import 'package:recoverly/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdultAddictionpage extends StatefulWidget {
  @override
  State<AdultAddictionpage> createState() => _AdultAddictionpageState();
}

class _AdultAddictionpageState extends State<AdultAddictionpage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tech Addiction")),
      body: Column(
        children: [
          TextButton(onPressed:  () {
            
          }, child: Text('out')),
          Center(child: Text("Welcome to Tech Addiction Page")),
        ],
      ),
    );
  }
}
