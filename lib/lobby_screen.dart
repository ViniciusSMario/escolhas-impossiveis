import 'package:flutter/material.dart';
import 'package:escolhas_impossiveis/category_selection_screen.dart';
import 'package:escolhas_impossiveis/donate_screen.dart';
import 'package:escolhas_impossiveis/info_screen.dart';

class LobbyScreen extends StatefulWidget {
  @override
  _LobbyScreenState createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CategorySelectionPage(),
    InfoPage(),
    // DonatePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0, // Remove a sombra da AppBar
        title: Text(
          'Escolhas Impossíveis',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //   colors: [Colors.indigo.shade700, Colors.indigoAccent.shade100],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: Colors.white,
            selectedItemColor: Colors.indigo,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categorias',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'Informações',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
