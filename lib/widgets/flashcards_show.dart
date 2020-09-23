import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/flashcards_finished_screen.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';

import "../providers/flashcards.dart";
import "../models/flashcard.dart";

class FlashcardsShow extends StatefulWidget {
  FlashcardsShow({Key key}) : super(key: key);

  @override
  _FlashcardsShowState createState() => _FlashcardsShowState();
}

class _FlashcardsShowState extends State<FlashcardsShow> {
  var switched = false;
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    final loadedFlashcards = Provider.of<Flashcards>(context);
    final flashcards = loadedFlashcards.items;

    var _editedFlashcard = Flashcard(
        id: flashcards[counter].id,
        category: flashcards[counter].id,
        complexity: flashcards[counter].complexity,
        points: flashcards[counter].points,
        question: flashcards[counter].question,
        answer: flashcards[counter].answer);

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
                  builder: (context) => FlashcardsFinishedScreen(),
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
      _editedFlashcard.points += 6;
      Provider.of<Flashcards>(context)
          .updatePoints(flashcards[counter].id, _editedFlashcard);
      _increaseCounter();
    }

    void _decreasePoints() {
      _editedFlashcard.points < 4
          ? _editedFlashcard.points = 0
          : _editedFlashcard.points -= 4;
      Provider.of<Flashcards>(context)
          .updatePoints(flashcards[counter].id, _editedFlashcard);
      _increaseCounter();
    }

    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Text(
            "Question ${counter + 1}/${flashcards.length}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SwipeDetector(
          onSwipeLeft: _increaseCounter,
          onSwipeRight: _decreaseCounter,
          swipeConfiguration: SwipeConfiguration(
            horizontalSwipeMinDisplacement: 10,
            horizontalSwipeMinVelocity: 30,
          ),
          child: Container(
            height: 450,
            decoration: BoxDecoration(
              border: Border.all(
                color: flashcards[counter].complexity == "Basic"
                    ? Colors.green
                    : flashcards[counter].complexity == "Intermediate"
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
                          flashcards[counter].question,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          flashcards[counter].answer,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 120,
              height: 80,
              child: FlatButton(
                color: Colors.blue,
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
                    width: 120,
                    height: 80,
                    child: FlatButton(
                      color: Colors.red,
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
                    width: 120,
                    height: 80,
                    child: FlatButton(
                      color: Colors.green,
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
                  )
          ],
        ),
      ],
    );
  }
}
