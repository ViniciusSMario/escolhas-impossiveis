import 'package:escolhas_impossiveis/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'lobby_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escolhas Impossíveis',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SplashScreen(), // Define a SplashScreen como tela inicial
    );
  }
}
