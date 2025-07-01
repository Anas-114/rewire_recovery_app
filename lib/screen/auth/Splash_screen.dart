import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recover/screen/auth/login_screen.dart';
import 'package:recover/screen/insideapp/%20bottum_nav_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recover/screen/insideapp/home_screen.dart';
import 'package:recover/screen/auth/addiction_selection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final selectedAddiction = prefs.getString('selectedAddiction');

    await Future.delayed(const Duration(seconds: 3));

    if (isLoggedIn && selectedAddiction != null && selectedAddiction.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => BottomNavBarScreen(selectedAddiction: selectedAddiction),
        ),
      );
    } else if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AddictionSelection()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Loginscreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            const SizedBox(height: 30),
            Text(
              'Recover',
              style: GoogleFonts.caprasimo(
                fontSize: 38,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your path to freedom begins here.',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
