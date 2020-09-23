import "package:flutter/material.dart";
import "package:swipedetector/swipedetector.dart";
import "package:provider/provider.dart";

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

    /* var _editedFlashcard = Flashcard(
        id: flashcards[counter].id,
        category: flashcards[counter].id,
        complexity: flashcards[counter].complexity,
        points: flashcards[counter].points,
        question: flashcards[counter].question,
        answer: flashcards[counter].answer); */

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 30,
                child: Text("${flashcards[80].question}"),
              ),
            ],
          );
  }
}
