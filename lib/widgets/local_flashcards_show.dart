import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/flashcards_finished_screen.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';
import "package:auto_size_text/auto_size_text.dart";

import "../providers/localFlashcards.dart";
import "../models/flashcard.dart";

class LocalFlashcardsShow extends StatefulWidget {
  LocalFlashcardsShow({Key key}) : super(key: key);

  @override
  _LocalFlashcardsShowState createState() => _LocalFlashcardsShowState();
}

class _LocalFlashcardsShowState extends State<LocalFlashcardsShow> {
  var switched = false;
  var counter = 0;
  List _incorrectFlashcards = [];

  @override
  Widget build(BuildContext context) {
    final loadedFlashcards = Provider.of<LocalFlashcards>(context);
    final flashcards = loadedFlashcards.items.take(10).toList();

    void _switchAnswer() {
      setState(() {
        switched == true ? switched = false : switched = true;
      });
    }

    void _increaseCounter() {
      setState(() {
        counter < flashcards.length - 1
            ? counter += 1
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FlashcardsFinishedScreen(
                      _incorrectFlashcards, flashcards.length),
                ),
              );
        switched = false;
      });
    }

    void _decreaseCounter() {
      setState(() {
        counter > 0 ? counter -= 1 : counter = counter;
        switched = false;
      });
    }

    void _increasePoints() {
      flashcards[counter].points == null
          ? flashcards[counter].points = 6
          : DateTime.now()
                      .difference(
                          DateTime.parse(flashcards[counter].lastReviewed))
                      .inDays >
                  1
              ? flashcards[counter].points += 6
              : flashcards[counter].points += 0;
      flashcards[counter].lastReviewed = DateTime.now().toString();
      var _editedFlashcard = Flashcard(
        id: flashcards[counter].id,
        category: flashcards[counter].category,
        subcategory: flashcards[counter].subcategory,
        complexity: flashcards[counter].complexity,
        points: flashcards[counter].points,
        question: flashcards[counter].question,
        answer: flashcards[counter].answer,
        viewed: flashcards[counter].viewed,
        lastReviewed: flashcards[counter].lastReviewed,
      );
      Provider.of<LocalFlashcards>(context)
          .updateFlashcard(flashcards[counter].id, _editedFlashcard);
      _increaseCounter();
    }

    void _decreasePoints() {
      DateTime.now()
                  .difference(DateTime.parse(flashcards[counter].lastReviewed))
                  .inDays <
              1
          ? flashcards[counter].points += 0
          : flashcards[counter].points == null
              ? flashcards[counter].points = 0
              : flashcards[counter].points < 4
                  ? flashcards[counter].points = 0
                  : flashcards[counter].points -= 4;
      flashcards[counter].lastReviewed = DateTime.now().toString();
      var _editedFlashcard = Flashcard(
        id: flashcards[counter].id,
        category: flashcards[counter].category,
        subcategory: flashcards[counter].subcategory,
        complexity: flashcards[counter].complexity,
        points: flashcards[counter].points,
        question: flashcards[counter].question,
        answer: flashcards[counter].answer,
        viewed: flashcards[counter].viewed,
        lastReviewed: flashcards[counter].lastReviewed,
      );
      Provider.of<LocalFlashcards>(context)
          .updateFlashcard(flashcards[counter].id, _editedFlashcard);
      _incorrectFlashcards.add(_editedFlashcard);
      _increaseCounter();
    }

    final appBar = AppBar(
      title: Text('Review Mode'),
    );

    return Container(
      height: MediaQuery.of(context).size.height - appBar.preferredSize.height,
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height) *
                0.05,
          ),
          SizedBox(
            child: Text(
              "Question ${counter + 1}/${flashcards.length}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height) *
                0.05,
          ),
          SwipeDetector(
            onSwipeLeft: _increaseCounter,
            onSwipeRight: _decreaseCounter,
            swipeConfiguration: SwipeConfiguration(
              horizontalSwipeMinDisplacement: 10,
              horizontalSwipeMinVelocity: 30,
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.65,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: flashcards[counter].complexity == "Basic"
                          ? Colors.green[300]
                          : flashcards[counter].complexity == "Intermediate"
                              ? Colors.orange[300]
                              : Colors.red[300],
                      width: 8),
                  bottom: BorderSide(
                      color: flashcards[counter].complexity == "Basic"
                          ? Colors.green[300]
                          : flashcards[counter].complexity == "Intermediate"
                              ? Colors.orange[300]
                              : Colors.red[300],
                      width: 8),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
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
                    height: 40,
                  ),
                  Container(
                    height: 200,
                    child: Align(
                      alignment: Alignment.center,
                      child: switched == false
                          ? AutoSizeText(
                              flashcards[counter].question,
                              maxLines: 10,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          : AutoSizeText(
                              flashcards[counter].answer,
                              maxLines: 10,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height) *
                0.02,
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height) *
                0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width) * 0.3,
                  height: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Colors.blue[300],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    onPressed: _switchAnswer,
                    child: Text(
                      "Flip card",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
                switched == true
                    ? SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.3,
                        height: 80,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: Colors.red[300],
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueAccent,
                          onPressed: _decreasePoints,
                          child: Text(
                            "Did not know",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 80,
                        width: 120,
                      ),
                switched == true
                    ? SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.3,
                        height: 80,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: Colors.green[300],
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueAccent,
                          onPressed: _increasePoints,
                          child: Text(
                            "I knew it",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 80,
                        width: 120,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
