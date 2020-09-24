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
    _items = dataList
        .map(
          (item) => Flashcard(
            id: item['id'],
            question: item['question'],
            answer: item['answer'],
            category: item["category"],
            complexity: item["complexity"],
            points: item["points"],
          ),
        )
        .toList();
    notifyListeners();
  }

  Future<void> updateFlashcard(id, newFlashcard) async {
    final flashcardIndex = _items.indexWhere((element) => element.id == id);
    await DBHelper.updateDB(id, newFlashcard);
    _items[flashcardIndex] = newFlashcard;
    notifyListeners();
  }
}
