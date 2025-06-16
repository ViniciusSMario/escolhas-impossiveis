import 'dart:convert';
import 'dart:math';
import 'package:escolhas_impossiveis/endgame_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:escolhas_impossiveis/models/card_model.dart';

class GameScreen extends StatefulWidget {
  final String category;

  GameScreen({required this.category});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  List<GameCard> deck = [];
  GameCard? selectedCard;
  int score = 0;
  late AnimationController _controller;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _loadDeck();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _flipAnimation = Tween<double>(begin: 0, end: 2).animate(_controller);
  }

  Future<void> _loadDeck() async {
    final String response = await rootBundle.loadString('assets/cards.json');
    final Map<String, dynamic> data = json.decode(response);

    setState(() {
      deck = (data[widget.category] as List<dynamic>)
          .map((card) => GameCard.fromJson(card as Map<String, dynamic>))
          .toList();
      deck.shuffle();
    });
  }

  void _revealCard(GameCard card) {
    setState(() {
      selectedCard = card;
      score += 10;
    });
    _controller.forward();
  }

  void _nextCard() {
    if (deck.isNotEmpty) {
      GameCard next = deck.removeAt(0);
      _controller.reverse(from: 1).then((_) {
        setState(() {
          selectedCard = next;
          score += 10;
        });
        _controller.forward(from: 0);
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EndGameScreen(score: score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Categoria: ${widget.category}',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.indigoAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (selectedCard == null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Escolha uma carta\npara iniciar o jogo!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 3.0,
                        color: Colors.black26,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            Expanded(
              child: selectedCard == null
                  ? GridView.builder(
                      padding: EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: deck.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _revealCard(deck[index]),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(color: Colors.white, width: 2),
                            ),
                            color: Colors.indigo[700],
                            child: Center(
                              child: Icon(
                                Icons.question_mark,
                                size: 40,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : AnimatedBuilder(
                      animation: _flipAnimation,
                      builder: (context, child) {
                        final angle = _flipAnimation.value * pi;
                        final isFront = angle < pi / 2;

                        return Transform(
                            transform: Matrix4.rotationY(angle),
                            alignment: Alignment.center,
                            child: isFront
                                ? Card(
                                    color: Colors.indigo,
                                    elevation: 4,
                                    child: Center(
                                      child: Text(
                                        'Revelando...',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.all(16),
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround, // Distribui os widgets verticalmente
                                      children: [
                                        // Primeira Opção
                                        Expanded(
                                          flex:
                                              3, // Define a proporção do espaço ocupado
                                          child: GestureDetector(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.redAccent,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(10, 10),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  selectedCard!.option1,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Texto "OU"
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Text(
                                                'OU',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.indigo,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Segunda Opção
                                        Expanded(
                                          flex:
                                              3, // Mesmo tamanho que a primeira opção
                                          child: GestureDetector(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                  boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(10, 10),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  selectedCard!.option2,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                16), // Espaçamento entre as opções e o botão
                                        // Botão "Próxima Carta"
                                        ElevatedButton(
                                          onPressed: _nextCard,
                                          child: Text(
                                            'Próxima Carta',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.indigo,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 24),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
