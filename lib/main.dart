 import 'package:flutter/material.dart';
import 'package:recoverly/screens/addiction_selection_page.dart';
import 'package:recoverly/screens/login_page.dart';
import 'package:recoverly/screens/splashscreen.dart';

void main(){
  runApp(MyApp());
 }
 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Addiction',
      home: Splashscreen(),

    );
  }
}