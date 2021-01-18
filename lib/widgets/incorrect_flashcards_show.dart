import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/review_selection_screen.dart';
import 'package:swipedetector/swipedetector.dart';
import "package:auto_size_text/auto_size_text.dart";

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

    final appBar = AppBar(
      title: Text('Review Mode'),
    );

    return Scaffold(
      appBar: appBar,
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
        ),
        height:
            MediaQuery.of(context).size.height - appBar.preferredSize.height,
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.02,
            ),
            SizedBox(
              child: FittedBox(
                child: Text(
                  "Question ${counter + 1}/${flashcards.length}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.02,
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
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height) *
                          0.02,
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
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height) *
                          0.04,
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height) *
                          0.45,
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.06,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width) * 0.3,
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height) *
                        0.11,
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
                      child: FittedBox(
                        child: Text(
                          "Flip card",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                  ),
                  switched == true
                      ? SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.3,
                          height: (MediaQuery.of(context).size.height -
                                  appBar.preferredSize.height) *
                              0.11,
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
                            child: FittedBox(
                              child: Text(
                                "Did not know",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.3,
                          height: (MediaQuery.of(context).size.height -
                                  appBar.preferredSize.height) *
                              0.11,
                        ),
                  switched == true
                      ? SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.3,
                          height: (MediaQuery.of(context).size.height -
                                  appBar.preferredSize.height) *
                              0.11,
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
                            child: FittedBox(
                              child: Text(
                                "I knew it",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.3,
                          height: (MediaQuery.of(context).size.height -
                                  appBar.preferredSize.height) *
                              0.11,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
