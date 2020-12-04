import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:auto_size_text/auto_size_text.dart";

import "../providers/localFlashcards.dart";
import "../widgets/main_drawer.dart";
import "../models/flashcard.dart";

class SearchSingleFlashcardScreen extends StatefulWidget {
  static const String routeName = "/Searchsingle";

  @override
  _SearchSingleFlashcardScreenState createState() =>
      _SearchSingleFlashcardScreenState();
}

class _SearchSingleFlashcardScreenState
    extends State<SearchSingleFlashcardScreen> {
  var switched = false;

  @override
  Widget build(BuildContext context) {
    final flashcardId = ModalRoute.of(context).settings.arguments as String;

    final loadedFlashcard = Provider.of<LocalFlashcards>(
      context,
      listen: false,
    ).findById(flashcardId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Single Flashcard"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              switched == true ? switched = false : switched = true;
            });
            loadedFlashcard.viewed = "yes";
            var _editedFlashcard = Flashcard(
                id: loadedFlashcard.id,
                category: loadedFlashcard.category,
                subcategory: loadedFlashcard.subcategory,
                complexity: loadedFlashcard.complexity,
                points: loadedFlashcard.points,
                question: loadedFlashcard.question,
                answer: loadedFlashcard.answer,
                viewed: loadedFlashcard.viewed);
            Provider.of<LocalFlashcards>(context)
                .setFlashcardasViewed(flashcardId, _editedFlashcard);
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 450,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: loadedFlashcard.complexity == "Basic"
                          ? Colors.green[300]
                          : loadedFlashcard.complexity == "Intermediate"
                              ? Colors.orange[300]
                              : Colors.red[300],
                      width: 8),
                  bottom: BorderSide(
                      color: loadedFlashcard.complexity == "Basic"
                          ? Colors.green[300]
                          : loadedFlashcard.complexity == "Intermediate"
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
                        ? AutoSizeText(
                            loadedFlashcard.question,
                            maxLines: 6,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        : AutoSizeText(
                            loadedFlashcard.answer,
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
      ),
    );
  }
}
