import 'package:flutter/material.dart';
import 'package:recoverly/screens/addiction_selection_page.dart';

import 'package:recoverly/screens/addictions/aduilt/aduil_addictionpage.dart';
import 'package:recoverly/screens/addictions/food/food_addictionpage.dart';
import 'package:recoverly/screens/addictions/life/lifestyle_habits.dart';

import 'package:recoverly/screens/addictions/mental/mental_addiction.dart';
import 'package:recoverly/screens/addictions/substance/substance_addiction.dart';
import 'package:recoverly/screens/addictions/tech/bottum.dart';
import 'package:recoverly/screens/addictions/tech/tech_home.dart';
import 'package:recoverly/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addictions/money/money_addiction.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    
    super.initState();
    checkUser();
  }
  @override




  Future<void> checkUser() async {
    await Future.delayed(Duration(seconds: 3));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final password = prefs.getString('password');
    final addiction = prefs.getString('addiction_type');

    if (email != null && password != null) {
      if (addiction != null) {
        Widget page;
        switch (addiction) {
          case "Tech Addiction":
            page = Bottum();
            break;
          case "Substance Addiction":
            page = SubstanceAddiction();
            break;
          case "Food Addiction":
            page = FoodAddictionpage();
            break;
          case "Mental Addiction":
            page = MentalAddiction();
            break;
          case "Money Addiction":
            page = MoneyAddiction();
            break;
          case "Lifestyle Habits":
            page = LifestyleHabits();
            break;
          case "Adult Content Addiction":
            page = AdultAddictionpage();
            break;
          default:
            page = SelectionPage();
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      } else {
        // loged but not selected
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SelectionPage()),
        );
      }
    } else {
      // not loged itself
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 180, color: const Color.fromARGB(255, 82, 122, 255)),
            SizedBox(height: 20),
            Text(
              "Recoverly",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
