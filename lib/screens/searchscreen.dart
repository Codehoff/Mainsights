import "package:flutter/material.dart";
import "dart:convert";
import "package:http/http.dart" as http;

import "../dummy_data.dart";
import "../models/flashcard.dart";

class Searchscreen extends StatelessWidget {
  static const routeName = "/search";

  static const url = "https://mainsights-1fb71.firebaseio.com/flashcards.json";

  Future<void> fetchAndSetFlashcards() async {
    const url = "https://mainsights-1fb71.firebaseio.com/flashcards.json";
    final response = await http.get(url);
    final List<Flashcard> loadedProducts = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
  }

  void _pushFlashcards() {
    dummyFlashcards.forEach((element) {
      http.post(
        url,
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
      SizedBox(height: 50),
      SizedBox(
        width: 200,
        height: 60,
        child: FlatButton(
          color: Colors.red,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: fetchAndSetFlashcards,
          child: Text(
            "Fetch Data",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),
    ]);
  }
}
