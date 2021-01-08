import 'dart:convert';

import 'package:flutter/foundation.dart';
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
          "subcategory": element.subcategory,
          "points": element.points,
          "viewed": element.viewed,
          "lastReviewed": DateTime(1984, 01, 01).toString(),
          "creatorId": userId,
        }),
      );
    });
  }

  Future<void> fetchAllFlashcards() async {
    final url =
        'https://mainsights-1fb71.firebaseio.com/flashcards/$userId.json?auth=$authToken';
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Flashcard> _extractedItems = [];
    extractedData.forEach((flashcardID, flashcardData) {
      _extractedItems.add(Flashcard(
        id: flashcardID,
        question: flashcardData["question"],
        answer: flashcardData["answer"],
        category: flashcardData["category"],
        subcategory: flashcardData["subcategory"],
        complexity: flashcardData["complexity"],
        points: flashcardData["points"],
        lastReviewed: flashcardData["lastReviewed"],
        viewed: flashcardData["viewed"],
      ));
    });
    _items = _extractedItems.toList();
  }

  Future<void> fetchAndSetFlashcards(
      dropdownValue1, dropdownValue2, dropdownValue3, dropdownValue4,
      [dropdownValue5]) async {
    final url =
        'https://mainsights-1fb71.firebaseio.com/flashcards/$userId.json?auth=$authToken';
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Flashcard> _extractedItems = [];
    extractedData.forEach((flashcardID, flashcardData) {
      _extractedItems.add(Flashcard(
        id: flashcardID,
        question: flashcardData["question"],
        answer: flashcardData["answer"],
        category: flashcardData["category"],
        subcategory: flashcardData["subcategory"],
        complexity: flashcardData["complexity"],
        points: flashcardData["points"],
        lastReviewed: flashcardData["lastReviewed"],
        viewed: flashcardData["viewed"],
      ));
    });
    var dropdownViewed = "";

    dropdownValue5 == ""
        ? dropdownValue5 = " "
        : dropdownValue5 = dropdownValue5;

    dropdownValue4 == "Viewed"
        ? dropdownViewed = "Has been viewed"
        : dropdownViewed = "not viewed";

    if (dropdownValue5 == null) {
      if (dropdownValue1 == "All" &&
          dropdownValue2 == "All" &&
          dropdownValue3 == "All" &&
          dropdownValue4 == "All") {
        _items = _extractedItems.toList();
      } else if (dropdownValue2 == "All" &&
          dropdownValue3 == "All" &&
          dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) => element.category == dropdownValue1)
            .toList();
      } else if (dropdownValue1 == "All" &&
          dropdownValue2 == "All" &&
          dropdownValue3 == "All") {
        _items = _extractedItems
            .where((element) => element.viewed == dropdownViewed)
            .toList();
      } else if (dropdownValue1 == "All" &&
          dropdownValue2 == "All" &&
          dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) => element.complexity == dropdownValue3)
            .toList();
      } else if (dropdownValue2 == "All" && dropdownValue3 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.category == dropdownValue1 &&
                element.viewed == dropdownViewed)
            .toList();
      } else if (dropdownValue2 == "All" && dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.category == dropdownValue1 &&
                element.complexity == dropdownValue3)
            .toList();
      } else if (dropdownValue3 == "All" && dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2)
            .toList();
      } else if (dropdownValue2 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.category == dropdownValue1 &&
                element.complexity == dropdownValue3 &&
                element.viewed == dropdownViewed)
            .toList();
      } else if (dropdownValue3 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2 &&
                element.viewed == dropdownViewed)
            .toList();
      } else if (dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2 &&
                element.complexity == dropdownValue3)
            .toList();
      } else
        _items = _extractedItems
            .where((element) =>
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2 &&
                element.complexity == dropdownValue3 &&
                element.viewed == dropdownViewed)
            .toList();
      notifyListeners();
    } else {
      if (dropdownValue1 == "All" &&
          dropdownValue2 == "All" &&
          dropdownValue3 == "All" &&
          dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) => (element.question
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) ||
                element.answer
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) ||
                element.category
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) ||
                element.subcategory
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase())))
            .toList();
      } else if (dropdownValue2 == "All" &&
          dropdownValue3 == "All" &&
          dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.category == dropdownValue1)
            .toList();
      } else if (dropdownValue1 == "All" &&
          dropdownValue2 == "All" &&
          dropdownValue3 == "All") {
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.viewed == dropdownViewed)
            .toList();
      } else if (dropdownValue1 == "All" &&
          dropdownValue2 == "All" &&
          dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.complexity == dropdownValue3)
            .toList();
      } else if (dropdownValue2 == "All" && dropdownValue3 == "All") {
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.category == dropdownValue1 &&
                element.viewed == dropdownViewed)
            .toList();
      } else if (dropdownValue1 == "All" && dropdownValue2 == "All") {
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.complexity == dropdownValue3 &&
                element.viewed == dropdownViewed)
            .toList();
      } else if (dropdownValue2 == "All" && dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.category == dropdownValue1 &&
                element.complexity == dropdownValue3)
            .toList();
      } else if (dropdownValue3 == "All" && dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2)
            .toList();
      } else if (dropdownValue2 == "All") {
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.category == dropdownValue1 &&
                element.complexity == dropdownValue3 &&
                element.viewed == dropdownViewed)
            .toList();
      } else if (dropdownValue3 == "All") {
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2 &&
                element.viewed == dropdownViewed)
            .toList();
      } else if (dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2 &&
                element.complexity == dropdownValue3)
            .toList();
      } else
        _items = _extractedItems
            .where((element) =>
                (element.question
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.answer
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.category
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase()) ||
                    element.subcategory
                        .toLowerCase()
                        .contains(dropdownValue5.toLowerCase())) &&
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2 &&
                element.complexity == dropdownValue3 &&
                element.viewed == dropdownViewed)
            .toList();

      notifyListeners();
    }
  }

  Future<void> fetchAndSetFlashcardsForReview() async {
    final url =
        'https://mainsights-1fb71.firebaseio.com/flashcards/$userId.json?auth=$authToken';
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Flashcard> _extractedItems = [];
    extractedData.forEach((flashcardID, flashcardData) {
      _extractedItems.add(Flashcard(
        id: flashcardID,
        question: flashcardData["question"],
        answer: flashcardData["answer"],
        category: flashcardData["category"],
        subcategory: flashcardData["subcategory"],
        complexity: flashcardData["complexity"],
        points: flashcardData["points"],
        lastReviewed: flashcardData["lastReviewed"],
        viewed: flashcardData["viewed"],
      ));
    });
    _items = _extractedItems
        .where((element) =>
            element.viewed != "not viewed" && element.toBeReviewedToday == true)
        .toList();
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
          "lastReviewed": newFlashcard.lastReviewed,
        },
      ),
    );
    _items[flashcardIndex] = newFlashcard;
    notifyListeners();
  }

  Future<void> setFlashcardAsViewed(String id, Flashcard newFlashcard) async {
    final flashcardIndex = _items.indexWhere((element) => element.id == id);
    final url =
        "https://mainsights-1fb71.firebaseio.com/flashcards/$userId/$id.json?auth=$authToken";
    http.patch(
      url,
      body: json.encode(
        {
          "viewed": newFlashcard.viewed,
          "lastReviewed": newFlashcard.lastReviewed,
        },
      ),
    );
    _items[flashcardIndex] = newFlashcard;
    notifyListeners();
  }
}
