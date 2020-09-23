import "package:flutter/material.dart";
import "package:swipedetector/swipedetector.dart";
import "package:provider/provider.dart";

import "../screens/flashcards_finished_screen.dart";
import "../models/flashcard.dart";
import "../providers/localFlashcards.dart";

class Studyscreen extends StatefulWidget {
  static const routeName = "/studyscreen";
  final String dropdownValue;

  const Studyscreen({this.dropdownValue});

  @override
  _StudyscreenState createState() => _StudyscreenState();
}

class _StudyscreenState extends State<Studyscreen> {
  var _isInit = true;
  var _isLoading = false;
  var switched = false;
  var counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<LocalFlashcards>(context)
          .fetchAndSetLocalFlashcards()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loadedFlashcards = Provider.of<LocalFlashcards>(context);
    final flashcards = loadedFlashcards.items;

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
      flashcards[counter].points += 6;
/*       Provider.of<Flashcards>(context)
          .updatePoints(flashcards[counter].id, flashcards[counter]); */
      _increaseCounter();
    }

    void _decreasePoints() {
      flashcards[counter].points < 4
          ? flashcards[counter].points = 0
          : flashcards[counter].points -= 4;
/*       Provider.of<Flashcards>(context)
          .updatePoints(flashcards[counter].id, _editedFlashcard); */
      _increaseCounter();
    }

    final _editedFlashcard = new Flashcard(
        id: flashcards[counter].id,
        question: flashcards[counter].question,
        answer: flashcards[counter].answer,
        category: flashcards[counter].category,
        complexity: flashcards[counter].complexity,
        points: flashcards[counter].points);

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
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
