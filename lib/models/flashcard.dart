import "package:flutter/foundation.dart";

enum Complexity {
  Basic,
  Indermediate,
  Advanced,
}

enum Category {
  Valuation,
  Accounting,
  Process,
}

class Flashcard {
  final String id;
  final String question;
  final String answer;
  final String category;
  final String complexity;
  int points;

  Flashcard({
    @required this.id,
    @required this.question,
    @required this.answer,
    @required this.category,
    @required this.complexity,
    this.points = 0,
  });
}
