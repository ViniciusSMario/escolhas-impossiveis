// Adicionado SplashScreen
import 'dart:async';
import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'lobby_screen.dart';

// SplashScreen Widget
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LobbyScreen()),
      );
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150, // Defina o tamanho da imagem
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo_escolhas_impossiveis.png"),
                  fit: BoxFit.contain, // Ajusta a imagem dentro do container
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Escolhas Impossíveis',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'O Jogo das Decisões Difíceis',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}