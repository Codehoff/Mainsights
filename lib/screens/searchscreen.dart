import "package:flutter/material.dart";
import "dart:convert";
import "package:http/http.dart" as http;

import "../dummy_data.dart";

class Searchscreen extends StatelessWidget {
  static const routeName = "/search";

  void _pushFlashcards() {
    final accountingFlashcards = dummyFlashcards
        .where((flashcard) => flashcard.category == "Accounting");
    final valuationFlashcards =
        dummyFlashcards.where((flashcard) => flashcard.category == "Valuation");
    final processFlashcards =
        dummyFlashcards.where((flashcard) => flashcard.category == "Process");
    const accountingUrl =
        "https://mainsights-1fb71.firebaseio.com/flashcards/accounting.json";
    const valuationUrl =
        "https://mainsights-1fb71.firebaseio.com/flashcards/valuation.json";
    const processUrl =
        "https://mainsights-1fb71.firebaseio.com/flashcards/process.json";
    accountingFlashcards.forEach((element) {
      http.post(
        accountingUrl,
        body: json.encode({
          "id": element.id,
          "question": element.question,
          "answer": element.answer,
          "complexity": element.complexity,
          "category": element.category,
          "points": element.points,
        }),
      );
    });
    valuationFlashcards.forEach((element) {
      http.post(
        valuationUrl,
        body: json.encode({
          "id": element.id,
          "question": element.question,
          "answer": element.answer,
          "complexity": element.complexity,
          "category": element.category,
          "points": element.points,
        }),
      );
    });
    processFlashcards.forEach((element) {
      http.post(
        processUrl,
        body: json.encode({
          "id": element.id,
          "question": element.question,
          "answer": element.answer,
          "complexity": element.complexity,
          "category": element.category,
          "points": element.points,
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: SizedBox(
          width: 200,
          height: 60,
          child: FlatButton(
            color: Colors.red,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: _pushFlashcards,
            child: Text(
              "Push to Server",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        ),
      ),
    ]);
  }
}
