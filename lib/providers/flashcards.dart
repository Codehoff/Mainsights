import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/flashcard.dart';
import 'package:http/http.dart' as http;

import "../models/flashcard.dart";
import "../dummy_data.dart";
import "../helpers/dbhelper.dart";

class Flashcards with ChangeNotifier {
  List<Flashcard> _items = [];
  List<Flashcard> _localItems = [];

  final String authToken;
  final String userId;

  Flashcards(this.authToken, this.userId, this._items);

  //online database//
  List<Flashcard> get items {
    return [..._items];
  }

  Flashcard findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> pushFlashcards() async {
    final url =
        "https://mainsights-1fb71.firebaseio.com/flashcards/$userId.json?auth=$authToken";

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
          "creatorId": userId,
        }),
      );
    });
  }

  Future<void> fetchAndSetFlashcards(category) async {
    final filterString = 'orderBy="category"&equalTo="$category"';
    final url =
        'https://mainsights-1fb71.firebaseio.com/flashcards/$userId.json?auth=$authToken&$filterString';
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
        "https://mainsights-1fb71.firebaseio.com/flashcards/$userId/$id.json?auth=$authToken";
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

  //Local Database//

  List<Flashcard> get localItems {
    return [..._items];
  }

  Flashcard findLocalById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> pushLocalFlashcard() async {
    dummyFlashcards.forEach((element) {
      DBHelper.insert('flashcards', {
        'id': DateTime.now().toString(),
        'question': element.question,
        'answer': element.answer,
        'category': element.category,
        'complexity': element.complexity,
        'points': element.points,
      });
    });
  }

  Future<void> fetchAndSetLocalFlashcards() async {
    final dataList = await DBHelper.getData('flashcards');
    _localItems = dataList
        .map(
          (item) => Flashcard(
            id: item['id'],
            question: item['title'],
            answer: item['image'],
            category: item["category"],
            complexity: item["complexity"],
            points: item["points"],
          ),
        )
        .toList();
    notifyListeners();
  }
}
