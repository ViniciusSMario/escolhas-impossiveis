class QuestionCard {
  final String question;
  final String option1;
  final String option2;

  QuestionCard({required this.question, required this.option1, required this.option2});

  factory QuestionCard.fromJson(Map<String, dynamic> json) {
    return QuestionCard(
      question: json['question'],
      option1: json['option1'],
      option2: json['option2'],
    );
  }
}
