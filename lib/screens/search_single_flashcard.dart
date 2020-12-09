import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:auto_size_text/auto_size_text.dart";

import "../providers/localFlashcards.dart";
import "../widgets/main_drawer.dart";

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

    final appBar = AppBar(
      title: Text("Single Flashcard"),
    );

    return Scaffold(
      appBar: appBar,
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              switched == true ? switched = false : switched = true;
            });
          },
          child: Container(
            padding: EdgeInsets.all(10),
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height) *
                0.85,
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
                      0.35,
                  alignment: Alignment.center,
                  child: switched == false
                      ? AutoSizeText(
                          loadedFlashcard.question,
                          maxLines: 10,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      : AutoSizeText(
                          loadedFlashcard.answer,
                          maxLines: 10,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
