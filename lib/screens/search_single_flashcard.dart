import "package:flutter/material.dart";
import 'package:swipedetector/swipedetector.dart';
import "package:auto_size_text/auto_size_text.dart";

import "../widgets/main_drawer.dart";
import "../screens/search_selection_screen.dart";

class SearchSingleFlashcardScreen extends StatefulWidget {
  static const String routeName = "/Searchsingle";

  final List flashcards;
  var counter;

  SearchSingleFlashcardScreen(this.flashcards, this.counter);

  @override
  _StudySingleFlashcardScreenState createState() =>
      _StudySingleFlashcardScreenState(flashcards, counter);
}

class _StudySingleFlashcardScreenState
    extends State<SearchSingleFlashcardScreen> {
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
                  builder: (context) => SearchSelectionScreen(),
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

    final appBar = AppBar(
      title: Text("Study"),
    );

    return Scaffold(
      appBar: appBar,
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
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.02,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  switched == true ? switched = false : switched = true;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height) *
                    0.8,
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
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height) *
                          0.55,
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
          ],
        ),
      ),
    );
  }
}
