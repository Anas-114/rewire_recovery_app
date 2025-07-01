<<<<<<< HEAD
 import 'package:flutter/material.dart';
import 'package:recoverly/screens/addiction_selection_page.dart';
import 'package:recoverly/screens/login_page.dart';
import 'package:recoverly/screens/splashscreen.dart';

void main(){
  runApp(MyApp());
 }
 class MyApp extends StatelessWidget {
=======
// main.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recover/models/type_model.dart';
import 'package:recover/models/progress_model.dart';
import 'package:recover/screen/auth/Splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ProgressModelAdapter());
  Hive.registerAdapter(TypeModelAdapter());
  await Hive.openBox<TypeModel>('taskBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
>>>>>>> c1732c3 (first commit)
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Addiction',
      home: Splashscreen(),

    );
  }
}
=======
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
>>>>>>> c1732c3 (first commit)
