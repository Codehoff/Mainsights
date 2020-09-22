import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/flashcard.dart';
import 'package:http/http.dart' as http;

import "../models/flashcard.dart";
import "../dummy_data.dart";

class Flashcards with ChangeNotifier {
  List<Flashcard> _items = [];

  final String authToken;
  final String userId;

  Flashcards(this.authToken, this.userId, this._items);

  List<Flashcard> get items {
    return [..._items];
  }

  Flashcard findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> pushFlashcards() async {
    final accountingFlashcards = dummyFlashcards
        .where((flashcard) => flashcard.category == "Accounting");
    final accountingUrl =
        "https://mainsights-1fb71.firebaseio.com/flashcards/$userId/accounting.json?auth=$authToken";

    final valuationFlashcards =
        dummyFlashcards.where((flashcard) => flashcard.category == "Valuation");
    final valuationUrl =
        "https://mainsights-1fb71.firebaseio.com/flashcards/$userId/valuation.json?auth=$authToken";

    final processFlashcards =
        dummyFlashcards.where((flashcard) => flashcard.category == "Process");
    final processUrl =
        "https://mainsights-1fb71.firebaseio.com/flashcards/$userId/process.json?auth=$authToken";

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
          "creatorId": userId,
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
          "creatorId": userId,
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
          "creatorId": userId,
        }),
      );
    });
  }

  Future<void> fetchAndSetFlashcards(category,
      [bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo"$userId"' : '';
    final url =
        'https://mainsights-1fb71.firebaseio.com/flashcards/$userId/$category.json?auth=$authToken&$filterString';

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
