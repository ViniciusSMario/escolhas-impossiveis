import 'dart:convert';
import 'dart:math';
import 'package:escolhas_impossiveis/lobby_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:escolhas_impossiveis/models/card_model.dart';

class EndGameScreen extends StatelessWidget {
  final int score;

  EndGameScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                textAlign: TextAlign.center,
                'Fim do Jogo!\n Você conseguiu terminar o baralho selecionado!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sua Pontuação: $score',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LobbyScreen()),
                    (route) => false,
                  );
                },
                child: Text('Voltar ao Lobby'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.indigo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
