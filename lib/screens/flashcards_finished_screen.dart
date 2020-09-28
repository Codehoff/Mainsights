import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/incorrect_flashcards_show.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

import 'review_selection_screen.dart';

class FlashcardsFinishedScreen extends StatefulWidget {
  static const routeName = "/finished";

  final List incorrectFlashcards;
  final int flashcardsLength;

  FlashcardsFinishedScreen(this.incorrectFlashcards, this.flashcardsLength);

  @override
  _FlashcardsFinishedScreenState createState() =>
      _FlashcardsFinishedScreenState(incorrectFlashcards, flashcardsLength);
}

class _FlashcardsFinishedScreenState extends State<FlashcardsFinishedScreen> {
  final List incorrectFlashcards;
  final int flashcardsLength;

  _FlashcardsFinishedScreenState(
      this.incorrectFlashcards, this.flashcardsLength);

  @override
  Widget build(BuildContext context) {
    List _flashcards = this.incorrectFlashcards;

    void _goBack() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewSelectionScreen()),
      );
    }

    void _changePage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IncorrectFlashcardsShow(_flashcards),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("Congratulations, you completed this set of cards!"),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
                "You answered ${flashcardsLength - _flashcards.length} out of $flashcardsLength questions correctly!"),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: _changePage,
            child: Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              width: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(3),
              ),
              padding: EdgeInsets.all(5),
              child: Text("Review incorrect questions"),
            ),
          ),
          GestureDetector(
            onTap: _goBack,
            child: Container(
              alignment: Alignment.center,
              width: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(3),
              ),
              padding: EdgeInsets.all(5),
              child: Text("Go Back"),
            ),
          ),
        ],
      ),
    );
  }
}
