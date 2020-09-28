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
  String lastReviewed;

  Flashcard({
    @required this.id,
    @required this.question,
    @required this.answer,
    @required this.category,
    @required this.subcategory,
    @required this.complexity,
    this.viewed = "not viewed",
    this.points = 0,
    this.lastReviewed,
  });

  int get level {
    if (this.points <= 5) {
      return 1;
    } else if (this.points > 5 && this.points <= 10) {
      return 2;
    } else if (this.points > 10 && this.points <= 20) {
      return 3;
    } else if (this.points > 20 && this.points <= 40) {
      return 4;
    } else
      return 5;
  }

  bool get toBeReviewedToday {
    if (this.level == 1 &&
        DateTime.now().difference(DateTime.parse(this.lastReviewed)).inDays >
            1) {
      return true;
    } else if (this.level == 2 &&
        DateTime.now().difference(DateTime.parse(this.lastReviewed)).inDays >
            3) {
      return true;
    } else if (this.level == 3 &&
        DateTime.now().difference(DateTime.parse(this.lastReviewed)).inDays >
            7) {
      return true;
    } else if (this.level == 4 &&
        DateTime.now().difference(DateTime.parse(this.lastReviewed)).inDays >
            14) {
      return true;
    } else if (this.level == 4 &&
        DateTime.now().difference(DateTime.parse(this.lastReviewed)).inDays >
            14) {
      return true;
    } else if (this.level == 5 &&
        DateTime.now().difference(DateTime.parse(this.lastReviewed)).inDays >
            28) {
      return true;
    } else if (this.lastReviewed == DateTime(2020, 01, 01).toString()) {
      return true;
    } else {
      return false;
    }
  }
}
