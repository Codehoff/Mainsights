import "package:flutter/material.dart";
import 'package:swipedetector/swipedetector.dart';

import "../dummy_data.dart";

class Flashcards extends StatefulWidget {
  @override
  _FlashcardsState createState() => _FlashcardsState();
}

class _FlashcardsState extends State<Flashcards> {
  var switched = false;
  int counter = 0;

  void _switchAnswer() {
    setState(() {
      switched == true ? switched = false : switched = true;
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
    _increaseCounter();
  }

  void _decreasePoints() {
    dummyFlashcards[counter].points < 4
        ? dummyFlashcards[counter].points = 0
        : dummyFlashcards[counter].points -= 4;
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
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange,
                width: 5,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: switched == false
                  ? Text(
                      dummyFlashcards[counter].question,
                      style: TextStyle(fontSize: 20),
                    )
                  : Text(
                      dummyFlashcards[counter].answer,
                      style: TextStyle(fontSize: 20),
                    ),
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
                  ),
          ],
        ),
      ],
    );
  }
}
