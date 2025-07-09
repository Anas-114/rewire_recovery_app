
 import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recoverly/models/progress_model.dart';
import 'package:recoverly/models/type_model.dart';
import 'package:recoverly/screen/auth/Splash_screen.dart';
import 'package:recoverly/screens/addiction_selection_page.dart';
import 'package:recoverly/screens/login_page.dart';
import 'package:recoverly/screens/splashscreen.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ProgressModelAdapter());
  Hive.registerAdapter(TypeModelAdapter());
  await Hive.openBox<TypeModel>('taskBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recover App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.deepPurple,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
