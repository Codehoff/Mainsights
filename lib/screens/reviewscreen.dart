import "package:flutter/material.dart";
import 'package:swipedetector/swipedetector.dart';
import "dart:convert";
import "package:http/http.dart" as http;

import "../models/flashcard.dart";

class Reviewscreen extends StatefulWidget {
  static const routeName = "/review";
  @override
  _ReviewsceenState createState() => _ReviewsceenState();
}

class _ReviewsceenState extends State<Reviewscreen> {
  var _isInit = true;
  var _isLoading = false;
  var switched = false;
  int counter = 0;

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
      fetchAndSetFlashcards().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  final List<Flashcard> loadedFlashcards = [];

  Future<void> fetchAndSetFlashcards() async {
    const url = "https://mainsights-1fb71.firebaseio.com/flashcards.json";

    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((flashcardID, flashcardData) {
      loadedFlashcards.add(Flashcard(
        id: flashcardID,
        question: flashcardData["question"],
        answer: flashcardData["answer"],
        category: flashcardData["category"],
        complexity: flashcardData["complexity"],
        points: flashcardData["points"],
      ));
    });
  }

  Future<void> updatePoints(String id) async {
    final url = "https://mainsights-1fb71.firebaseio.com/flashcards/$id.json";
    http.patch(
      url,
      body: json.encode(
        {
          "points": loadedFlashcards[counter].points,
        },
      ),
    );
  }

  void _switchAnswer() {
    setState(() {
      switched == true ? switched = false : switched = true;
    });
  }

  void _increaseCounter() {
    setState(() {
      counter < loadedFlashcards.length - 1 ? counter += 1 : counter = counter;
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
    loadedFlashcards[counter].points += 6;
    updatePoints(loadedFlashcards[counter].id);
    _increaseCounter();
  }

  void _decreasePoints() {
    loadedFlashcards[counter].points < 4
        ? loadedFlashcards[counter].points = 0
        : loadedFlashcards[counter].points -= 4;
    updatePoints(loadedFlashcards[counter].id);
    _increaseCounter();
  }

  @override
  Widget build(BuildContext context) {
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
                  "Question ${counter + 1}/${loadedFlashcards.length}",
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
                      color: loadedFlashcards[counter].complexity == "Basic"
                          ? Colors.green
                          : loadedFlashcards[counter].complexity ==
                                  "Intermediate"
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
                                loadedFlashcards[counter].question,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            : Text(
                                loadedFlashcards[counter].answer,
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
