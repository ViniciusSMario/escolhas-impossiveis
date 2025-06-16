import 'dart:convert';
import 'dart:math';
import 'package:escolhas_impossiveis/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sobre o Escolhas Impossíveis',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'O Escolhas Impossíveis é um aplicativo projetado para diversão em grupo, '
            'promovendo conversas descontraídas e decisões desafiadoras. Com categorias para todas as idades, '
            'ele se adapta a diferentes contextos, garantindo momentos de alegria e reflexão.',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          SizedBox(height: 20),
          Text(
            'Como funciona?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "- Escolha uma categoria que combina com o grupo. \n - Revele as perguntas e deixe o grupo debater as respostas. \n - Troque de categoria sempre que quiser!",
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          SizedBox(height: 20),
          Text(
            'Nosso Objetivo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Queremos proporcionar momentos únicos de diversão e conexão entre amigos e familiares. '
            'Esperamos que o Escolhas Impossíveis seja parte dos seus melhores momentos.',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
