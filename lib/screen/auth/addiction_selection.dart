import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recover/screen/insideapp/%20bottum_nav_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/screen/insideapp/home_screen.dart';

class AddictionSelection extends StatefulWidget {
  const AddictionSelection({super.key});

  @override
  State<AddictionSelection> createState() => _AddictionSelectionState();
}

final List<Map<String, dynamic>> addictions = [
  {"title": "Tech Addiction", "img": 'assets/images/tech.png'},
  {"title": "Food Addiction", "img": 'assets/images/food.png'},
  {"title": "Adultery Content Addiction", "img": 'assets/images/adult.png'},
  {"title": "Money Addiction", "img": 'assets/images/money.png'},
  {"title": "Substance Addiction", "img": 'assets/images/substance.png'},
];

class _AddictionSelectionState extends State<AddictionSelection> {
  Future<void> _storeSelectedAddiction(String addictionType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('selectedAddiction', addictionType);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Select Type of Addiction',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 3, 59, 116),
              fontSize: 23,
            ),
          ),
          backgroundColor: Colors.cyanAccent.shade400,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.6,
            ),
            itemCount: addictions.length,
            itemBuilder: (context, index) {
              final addiction = addictions[index];
              return GestureDetector(
                onTap: () async {
                  await _storeSelectedAddiction(addiction['title']);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BottomNavBarScreen(
                        selectedAddiction: addiction['title'],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: const BorderSide(color: Colors.blue, width: 0.8),
                      vertical: const BorderSide(color: Colors.blue, width: 2.5),
                    ),
                    image: DecorationImage(
                      image: AssetImage(addiction['img']),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(75),
                      topRight: Radius.circular(75),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        addiction["title"],
                        style: GoogleFonts.caprasimo(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: const Offset(2, 2),
                              blurRadius: 6,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
