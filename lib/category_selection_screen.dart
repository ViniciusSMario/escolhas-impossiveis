import 'dart:convert';
import 'dart:math';
import 'package:escolhas_impossiveis/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:escolhas_impossiveis/models/card_model.dart';

class CategorySelectionPage extends StatelessWidget {
  final List<String> categories = ['+18', 'Infantil', 'Família', 'Amigos', 'Vida Profissional', 'Viagens', 'Tecnologia', 'Comida'];
  final Map<String, IconData> categoryIcons = {
    '+18': Icons.local_bar,
    'Infantil': Icons.child_friendly,
    'Família': Icons.group,
    'Amigos': Icons.emoji_people,
    'Vida Profissional': Icons.card_travel,
    'Viagens': Icons.travel_explore,
    'Tecnologia': Icons.computer,
    'Comida': Icons.food_bank,
  };

  void joinGame(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(
          category: category,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selecione uma categoria para começar:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Exibir 2 colunas
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                String category = categories[index];
                return GestureDetector(
                  onTap: () => joinGame(context, category),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.indigo[400],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categoryIcons[category],
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
