import 'dart:convert';
import 'dart:math';
import 'package:escolhas_impossiveis/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:escolhas_impossiveis/models/card_model.dart';

class DonatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apoie o App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Considere fazer uma doação para ajudar no desenvolvimento '
            'e manutenção do aplicativo.',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Obrigado!'),
                    content: Text('Sua doação é muito importante para nós.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Fechar'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Fazer Doação'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
