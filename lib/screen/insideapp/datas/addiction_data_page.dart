import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionDetailPage extends StatelessWidget {
  final String title;
  final String content;

  const SectionDetailPage({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 3, 59, 116),
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.cyanAccent.shade400,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Text(
            content,
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
