import 'package:flutter/material.dart';
import 'game_screen.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = ['+18', 'Infantil', 'Família', 'Amigos'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione a Categoria'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameScreen(category: categories[index]),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
