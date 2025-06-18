import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recoverly/screens/addictions/aduilt/aduil_addictionpage.dart';
import 'package:recoverly/screens/addictions/data_not_selected.dart';
import 'package:recoverly/screens/addictions/food/food_addictionpage.dart';
import 'package:recoverly/screens/addictions/life/lifestyle_habits.dart';
import 'package:recoverly/screens/addictions/mental/mental_addiction.dart';
import 'package:recoverly/screens/addictions/money/money_addiction.dart';
import 'package:recoverly/screens/addictions/substance/substance_addiction.dart';
import 'package:recoverly/screens/addictions/tech/bottum.dart';
import 'package:recoverly/screens/addictions/tech/tech_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionPage extends StatelessWidget {
  SelectionPage({super.key});

  final List<Map<String, String>> addictions = [
    {"icon": "📱", "title": "Tech Addiction"},
    {"icon": "🚬", "title": "Substance Addiction"},
    {"icon": "🍔", "title": "Food Addiction"},
    {"icon": "💸", "title": "Money Addiction"},
    {"icon": "💭", "title": "Mental Addiction"},
    {"icon": "🔞", "title": "Adult Content Addiction"},
    {"icon": "😴", "title": "Lifestyle Habits"},
  ];

  
  void onCategorySelected(BuildContext context, String category) async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
      await prefs.setString('addiction_type', category);
    Widget page ;
    switch (category) {
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

      case "Lifestyle Addiction":
        page = LifestyleHabits();
        break;
      case "Adult Content Addiction":
        page = AdultAddictionpage();
        break;

      default:
        page = DefaultPage();  
    }

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Select Your Addiction",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(
              255,
              21,
              48,
              168,
            ), 
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),

      body: ListView.builder(
        itemCount: addictions.length,
        itemBuilder: (context, index) {
          final addiction = addictions[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Color(0xFFADD8E6),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFADD8E6), // light blue background
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.blueAccent, // border color
                  width: 2, // border width
                ),
              ),
              child: SizedBox(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 26,
                  ),

                  leading: Text(
                    addiction['icon']!,
                    style: TextStyle(fontSize: 40),
                  ),

                  title: Text(
                    addiction['title']!,
                    style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 247, 55, 42),
                    ),
                  ),
                  onTap: () => onCategorySelected(context, addiction['title']!),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
