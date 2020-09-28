import "package:flutter/material.dart";

import "../widgets/incorrect_flashcards_show.dart";

class ReviewIncorrectScreen extends StatefulWidget {
  static const routeName = "/ReviewIncorrectScreen";
  final List incorrectFlashcards;

  ReviewIncorrectScreen({this.incorrectFlashcards});

  @override
  _ReviewIncorrectScreenState createState() =>
      _ReviewIncorrectScreenState(incorrectFlashcards);
}

class _ReviewIncorrectScreenState extends State<ReviewIncorrectScreen> {
  List incorrectFlashcards;

  _ReviewIncorrectScreenState(this.incorrectFlashcards);

  @override
  Widget build(BuildContext context) {
    return IncorrectFlashcardsShow(incorrectFlashcards);
  }
}
