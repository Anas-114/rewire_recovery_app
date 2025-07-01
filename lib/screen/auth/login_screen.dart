import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recover/screen/auth/addiction_selection.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() async {
    if (formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('email', emailController.text.trim());
      await prefs.setString('password', passwordController.text.trim());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AddictionSelection()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fix errors before continuing')),
      );
    }
  }

  InputDecoration inputDecoration(String label, String hint) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      labelStyle: const TextStyle(color: Color.fromARGB(255, 3, 59, 116)),
      hintStyle: const TextStyle(color: Colors.blue),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.blueAccent.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '"Recovery isn’t a race. You don’t have to feel guilty for taking it one day at a time".',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    color: const Color.fromARGB(255, 3, 59, 116),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email can’t be empty';
                    } else if (!value.contains('@')) {
                      return 'Include @ in email';
                    }
                    return null;
                  },
                  decoration: inputDecoration('Email', 'Enter your email'),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password can’t be empty';
                    } else if (value.length <= 6) {
                      return 'Include at least 6 characters';
                    }
                    return null;
                  },
                  decoration: inputDecoration('Password', 'Enter your password'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
