import "package:flutter/foundation.dart";

class Flashcard {
  String id;
  final String question;
  final String answer;
  final String category;
  final String subcategory;
  final String complexity;
  String viewed;
  int points;

  Flashcard({
    @required this.id,
    @required this.question,
    @required this.answer,
    @required this.category,
    @required this.subcategory,
    @required this.complexity,
    this.viewed = "not viewed",
    this.points = 0,
  });
}
