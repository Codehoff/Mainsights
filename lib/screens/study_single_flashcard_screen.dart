import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../providers/localFlashcards.dart";
import "../widgets/main_drawer.dart";
import "../models/flashcard.dart";

class StudySingleFlashcardScreen extends StatefulWidget {
  static const String routeName = "/studysingle";

  @override
  _StudySingleFlashcardScreenState createState() =>
      _StudySingleFlashcardScreenState();
}

class _StudySingleFlashcardScreenState
    extends State<StudySingleFlashcardScreen> {
  var switched = false;

  @override
  Widget build(BuildContext context) {
    final flashcardId = ModalRoute.of(context).settings.arguments as String;

    final loadedFlashcard = Provider.of<LocalFlashcards>(
      context,
      listen: false,
    ).findById(flashcardId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Single Flashcard"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                switched == true ? switched = false : switched = true;
              });
              loadedFlashcard.viewed = "yes";
              var _editedFlashcard = Flashcard(
                  id: loadedFlashcard.id,
                  category: loadedFlashcard.category,
                  subcategory: loadedFlashcard.subcategory,
                  complexity: loadedFlashcard.complexity,
                  points: loadedFlashcard.points,
                  question: loadedFlashcard.question,
                  answer: loadedFlashcard.answer,
                  viewed: loadedFlashcard.viewed,
                  lastReviewed: DateTime(2020, 01, 01).toString());
              Provider.of<LocalFlashcards>(context)
                  .setFlashcardasViewed(flashcardId, _editedFlashcard);
            },
            child: Center(
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: loadedFlashcard.complexity == "Basic"
                        ? Colors.green
                        : loadedFlashcard.complexity == "Intermediate"
                            ? Colors.orange
                            : Colors.red,
                    width: 5,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      child: switched == false
                          ? Text(
                              "Question:",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "Answer:",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: switched == false
                          ? Text(
                              loadedFlashcard.question,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          : Text(
                              loadedFlashcard.answer,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(border: new Border.all(width: 3)),
            alignment: Alignment.center,
            child: Text(
              "You're in chapter ${loadedFlashcard.category}",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
