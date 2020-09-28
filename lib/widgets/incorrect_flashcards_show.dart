import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/review_selection_screen.dart';
import 'package:swipedetector/swipedetector.dart';

import "../widgets/main_drawer.dart";

class IncorrectFlashcardsShow extends StatefulWidget {
  final List incorrectFlashcards;

  IncorrectFlashcardsShow(this.incorrectFlashcards);

  @override
  _IncorrectFlashcardsShowState createState() =>
      _IncorrectFlashcardsShowState(incorrectFlashcards);
}

class _IncorrectFlashcardsShowState extends State<IncorrectFlashcardsShow> {
  var switched = false;
  var counter = 0;
  List _incorrectFlashcards;

  _IncorrectFlashcardsShowState(this._incorrectFlashcards);

  @override
  Widget build(BuildContext context) {
    final flashcards = _incorrectFlashcards;

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
                  builder: (context) => ReviewSelectionScreen(),
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
      _increaseCounter();
    }

    void _decreasePoints() {
      _increaseCounter();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Review Mode'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Text(
              "Incorrect question ${counter + 1}/${flashcards.length}",
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
      ),
    );
  }
}
