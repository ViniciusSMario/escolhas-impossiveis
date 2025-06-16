class GameCard {
  final String question;
  final String option1;
  final String option2;

  GameCard({
    required this.question,
    required this.option1,
    required this.option2,
  });

  factory GameCard.fromJson(Map<String, dynamic> json) {
    return GameCard(
      question: json['question'] as String,
      option1: json['option1'] as String,
      option2: json['option2'] as String,
    );
  }
}
