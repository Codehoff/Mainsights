import "package:flutter/material.dart";
import 'package:flutter_complete_guide/screens/study_selection_screen.dart';
import "package:provider/provider.dart";
import 'package:swipedetector/swipedetector.dart';
import "package:auto_size_text/auto_size_text.dart";

import "../providers/localFlashcards.dart";
import "../widgets/main_drawer.dart";
import "../models/flashcard.dart";

class StudySingleFlashcardScreen extends StatefulWidget {
  static const String routeName = "/studysingle";

  final List flashcards;
  var counter;

  StudySingleFlashcardScreen(this.flashcards, this.counter);

  @override
  _StudySingleFlashcardScreenState createState() =>
      _StudySingleFlashcardScreenState(flashcards, counter);
}

class _StudySingleFlashcardScreenState
    extends State<StudySingleFlashcardScreen> {
  final List flashcards;
  var counter;

  _StudySingleFlashcardScreenState(this.flashcards, this.counter);

  var switched = false;

  @override
  Widget build(BuildContext context) {
    void _increaseCounter() {
      setState(() {
        counter < flashcards.length - 1
            ? counter += 1
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => StudySelectionScreen(),
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Study"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: SwipeDetector(
        onSwipeLeft: _increaseCounter,
        onSwipeRight: _decreaseCounter,
        swipeConfiguration: SwipeConfiguration(
          horizontalSwipeMinDisplacement: 10,
          horizontalSwipeMinVelocity: 30,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Center(
                child: Text(
                  "Question ${counter + 1} of ${flashcards.length}",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  switched == true ? switched = false : switched = true;
                });
                flashcards[counter].viewed = "viewed";
                var _editedFlashcard = Flashcard(
                    id: flashcards[counter].id,
                    category: flashcards[counter].category,
                    subcategory: flashcards[counter].subcategory,
                    complexity: flashcards[counter].complexity,
                    points: flashcards[counter].points,
                    question: flashcards[counter].question,
                    answer: flashcards[counter].answer,
                    viewed: flashcards[counter].viewed,
                    lastReviewed: DateTime(2020, 01, 01).toString());
                Provider.of<LocalFlashcards>(context).setFlashcardasViewed(
                    flashcards[counter].id, _editedFlashcard);
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 450,
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
                        height: 100,
                      ),
                      Container(
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
                            ? AutoSizeText(
                                flashcards[counter].question,
                                maxLines: 6,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            : AutoSizeText(
                                flashcards[counter].answer,
                                maxLines: 6,
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(15),
                  height: 80,
                  decoration: BoxDecoration(
                    border: new Border.all(
                      width: 3,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "You're in chapter: ${flashcards[counter].category}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
