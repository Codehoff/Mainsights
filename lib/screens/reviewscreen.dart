import "package:flutter/material.dart";
import 'package:swipedetector/swipedetector.dart';
import "dart:convert";
import "package:http/http.dart" as http;

import "../dummy_data.dart";
import "../models/flashcard.dart";

class Reviewscreen extends StatefulWidget {
  static const routeName = "/review";
  @override
  _ReviewsceenState createState() => _ReviewsceenState();
}

class _ReviewsceenState extends State<Reviewscreen> {
  var switched = false;
  int counter = 0;

  static const url = "https://mainsights-1fb71.firebaseio.com/flashcards.json";

  void _pushFlashcard() {
    http.post(
      url,
      body: json.encode({
        "id": dummyFlashcards[counter].id,
        "question": dummyFlashcards[counter].question,
        "answer": dummyFlashcards[counter].answer,
        "complexity": dummyFlashcards[counter].complexity,
        "category": dummyFlashcards[counter].category,
        "points": dummyFlashcards[counter].points,
      }),
    );
  }

  void _patchFlashcard() {
    http.put(
      url,
      body: json.encode({
        "id": dummyFlashcards[counter].id,
        "points": dummyFlashcards[counter].points,
      }),
    );
  }

  void _switchAnswer() {
    setState(() {
      switched == true ? switched = false : switched = true;
      _pushFlashcard();
    });
  }

  void _increaseCounter() {
    setState(() {
      counter < dummyFlashcards.length - 1 ? counter += 1 : counter = counter;
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
    dummyFlashcards[counter].points += 6;
    _patchFlashcard();
    _increaseCounter();
  }

  void _decreasePoints() {
    dummyFlashcards[counter].points < 4
        ? dummyFlashcards[counter].points = 0
        : dummyFlashcards[counter].points -= 4;
    _patchFlashcard();
    _increaseCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Text(
            "Question ${counter + 1}/${dummyFlashcards.length}",
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
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: dummyFlashcards[counter].complexity == "Basic"
                    ? Colors.green
                    : dummyFlashcards[counter].complexity == "Intermediate"
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
                          dummyFlashcards[counter].question,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          dummyFlashcards[counter].answer,
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
