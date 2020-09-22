import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/flashcard.dart';
import 'package:http/http.dart' as http;

import "../models/flashcard.dart";

class Flashcards with ChangeNotifier {
  List<Flashcard> _items = [];

  final String authToken;

  Flashcards(this.authToken, this._items);

  List<Flashcard> get items {
    return [..._items];
  }

  Flashcard findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchAndSetFlashcards(category) async {
    final url =
        "https://mainsights-1fb71.firebaseio.com/flashcards/$category.json?auth=$authToken";

    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Flashcard> loadedFlashcards = [];
    extractedData.forEach((flashcardID, flashcardData) {
      loadedFlashcards.add(Flashcard(
        id: flashcardID,
        question: flashcardData["question"],
        answer: flashcardData["answer"],
        category: flashcardData["category"],
        complexity: flashcardData["complexity"],
        points: flashcardData["points"],
      ));
    });
    _items = loadedFlashcards;
    notifyListeners();
  }

  Future<void> updatePoints(String id, Flashcard newFlashcard) async {
    final flashcardIndex = _items.indexWhere((element) => element.id == id);
    final url =
        "https://mainsights-1fb71.firebaseio.com/flashcards/accounting/$id.json?auth=$authToken";
    http.patch(
      url,
      body: json.encode(
        {
          "points": newFlashcard.points,
        },
      ),
    );
    _items[flashcardIndex] = newFlashcard;
    notifyListeners();
  }
}
