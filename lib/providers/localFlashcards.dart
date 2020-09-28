import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/flashcard.dart';

import "../models/flashcard.dart";
import "../dummy_data.dart";
import "../helpers/dbhelper.dart";

class LocalFlashcards with ChangeNotifier {
  List<Flashcard> _items = [];

  List<Flashcard> get items {
    return [..._items];
  }

  Flashcard findById(String id) {
    return _items.firstWhere((flashcard) => flashcard.id == id);
  }

  Future<void> pushLocalFlashcard() async {
    dummyFlashcards.forEach((element) {
      DBHelper.insert('flashcards', {
        'id': DateTime.now().toString(),
        'question': element.question,
        'answer': element.answer,
        'category': element.category,
        "subcategory": element.subcategory,
        'complexity': element.complexity,
        'points': element.points,
        'viewed': element.viewed,
      });
    });
  }

  Future<void> fetchAndSetLocalFlashcards(
      dropdownValue1, dropdownValue2, dropdownValue3, dropdownValue4,
      [dropdownValue5]) async {
    final dataList = await DBHelper.getData('flashcards');
    final _extractedItems = dataList
        .map(
          (item) => Flashcard(
            id: item['id'],
            question: item['question'],
            answer: item['answer'],
            category: item["category"],
            subcategory: item["subcategory"],
            complexity: item["complexity"],
            points: item["points"],
            viewed: item["viewed"],
          ),
        )
        .toList();
    var dropdownViewed = "";

    dropdownValue4 == "Viewed"
        ? dropdownViewed = "Has been viewed"
        : dropdownViewed = "not viewed";

    if (dropdownValue5 == null) {
      if (dropdownValue2 == "All" &&
          dropdownValue3 == "All" &&
          dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) => element.category == dropdownValue1)
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
      if (dropdownValue2 == "All" &&
          dropdownValue3 == "All" &&
          dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.question
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) &&
                element.category == dropdownValue1)
            .toList();
      } else if (dropdownValue2 == "All" && dropdownValue3 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.question
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) &&
                element.category == dropdownValue1 &&
                element.viewed == dropdownValue4)
            .toList();
      } else if (dropdownValue2 == "All" && dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.question
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) &&
                element.category == dropdownValue1 &&
                element.complexity == dropdownValue3)
            .toList();
      } else if (dropdownValue3 == "All" && dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.question
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) &&
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2)
            .toList();
      } else if (dropdownValue2 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.question
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) &&
                element.category == dropdownValue1 &&
                element.complexity == dropdownValue3 &&
                element.viewed == dropdownValue4)
            .toList();
      } else if (dropdownValue3 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.question
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) &&
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2 &&
                element.viewed == dropdownValue4)
            .toList();
      } else if (dropdownValue4 == "All") {
        _items = _extractedItems
            .where((element) =>
                element.question
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) &&
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2 &&
                element.complexity == dropdownValue3)
            .toList();
      } else
        _items = _extractedItems
            .where((element) =>
                element.question
                    .toLowerCase()
                    .contains(dropdownValue5.toLowerCase()) &&
                element.category == dropdownValue1 &&
                element.subcategory == dropdownValue2 &&
                element.complexity == dropdownValue3 &&
                element.viewed == dropdownValue4)
            .toList();

      notifyListeners();
    }
  }

  Future<void> fetchAndSetLocalFlashcardsForReview() async {
    final dataList = await DBHelper.getData('flashcards');
    final _extractedItems = dataList
        .map(
          (item) => Flashcard(
            id: item['id'],
            question: item['question'],
            answer: item['answer'],
            category: item["category"],
            subcategory: item["subcategory"],
            complexity: item["complexity"],
            points: item["points"],
            viewed: item["viewed"],
            lastReviewed: item["lastReviewed"],
          ),
        )
        .toList();

    _items = _extractedItems
        .where((element) =>
            element.viewed != "not viewed" && element.toBeReviewedToday == true)
        .toList();

    notifyListeners();
  }

  Future<void> updateFlashcard(id, newFlashcard) async {
    final flashcardIndex = _items.indexWhere((element) => element.id == id);
    await DBHelper.updateDB(id, newFlashcard);
    _items[flashcardIndex] = newFlashcard;
    notifyListeners();
  }

  Future<void> setFlashcardasViewed(id, newFlashcard) async {
    final flashcardIndex = _items.indexWhere((element) => element.id == id);
    await DBHelper.setFlashcardAsViewed(id, newFlashcard);
    _items[flashcardIndex] = newFlashcard;
    notifyListeners();
  }
}
