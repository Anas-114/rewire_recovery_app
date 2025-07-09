import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recoverly/screen/auth/login_screen.dart';
import 'package:recoverly/screen/insideapp/datas/addiction_data_page.dart';
 
import 'package:recoverly/screen/insideapp/datas/datas_of_all_addictions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  final String selectedAddiction;
  const HomeScreen({super.key, required this.selectedAddiction});

  @override
  Widget build(BuildContext context) {
    final datas = addictionContent[selectedAddiction] ?? [];

    final Map<String, String> addictionImages = {
      'Tech Addiction': 'assets/images/tech.png',
      'Food Addiction': 'assets/images/food.png',
      'Adultery Content Addiction': 'assets/images/adult.png',
      'Money Addiction': 'assets/images/money.png',
      'Substance Addiction': 'assets/images/substance.png',
    };

    return Scaffold(
      appBar:  PreferredSize(
  preferredSize: const Size.fromHeight(100),
  child: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.red.shade300, Colors.blueAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.blueAccent.withOpacity(0.4),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Centered title
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Welcome bro, no worries\n— we can recover!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.capriola(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 3, 59, 116),
                  ),
                ),
              ),
            ],
          ),

           Positioned(
            left: 12,
            top: 8,
            child: GestureDetector(
              onTap: () async {
                final shouldLogout = await showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Logout?'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );

                if (shouldLogout == true) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('isLoggedIn');
                  await prefs.remove('selectedAddiction');
                   
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginscreen()));
                }
              },
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 16,
                child: const Icon(Icons.logout, size: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.indigoAccent, width: 3),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightBlueAccent.shade700,
                    blurRadius: 10,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                addictionImages[selectedAddiction] ?? 'assets/images/ tech.png',
                fit: BoxFit.cover,
              ),
            ),
            if (datas.isEmpty)
              const Center(
                child: Text("No data found!", style: TextStyle(fontSize: 18)),
              )
            else
              Padding(
                padding: const EdgeInsets.all(16),
                child: datas.isEmpty
                    ? const Text(
                        "No content for this addiction.",
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 1,
                            ),
                        itemCount: datas.length,
                        itemBuilder: (context, index) {
                          final datass = datas[index];
                          return CustomGusterdetecter(
                            context: context,
                            title: datass['title'] ?? 'No title',
                            content: datass['content'] ?? 'No content',
                          );
                        },
                      ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget CustomGusterdetecter({
  required BuildContext context,
  required String title,
  required String content,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SectionDetailPage(title: title, content: content),
        ),
      );
    },
    child: Container(
      height: 100,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.cyan.shade300,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.lightBlue,
            blurRadius: 5,
            offset: Offset(0, 2.5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 10),
          Text("Addiction", style: GoogleFonts.poppins(fontSize: 25)),
        ],
      ),
    ),
  );
}
