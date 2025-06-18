import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recoverly/screens/addiction_selection_page.dart';
import 'package:recoverly/widgets/widgetsoflogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void checkLogin() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('password', password);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SelectionPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter email and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Text(
                
                "Recovery isn’t a race. You don’t have to feel guilty for taking it one day at a time.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.blue.shade400,
                  // fontStyle: FontStyle.italic,
                  // fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),

            Padding(

              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                decoration: customInput('Email', 'enter the email'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: passwordController,
                decoration: customInput('Password', 'enter the password'),
                style: TextStyle(fontSize: 18),
                cursorColor: const Color.fromARGB(255, 18, 1, 48),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                checkLogin();
              },
              style: customButtonStyle(),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
