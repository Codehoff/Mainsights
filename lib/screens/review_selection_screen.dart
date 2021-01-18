import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:auto_size_text/auto_size_text.dart";

import '../widgets/main_drawer.dart';
import 'review_screen.dart';
import "../providers/flashcards.dart";

class ReviewSelectionScreen extends StatefulWidget {
  static const routeName = "/reviewselection";
  @override
  _ReviewSelectionScreenState createState() => _ReviewSelectionScreenState();
}

class _ReviewSelectionScreenState extends State<ReviewSelectionScreen> {
  var _isInit = true;
  var _isLoading = false;

  void changePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Reviewscreen(),
      ),
    );
  }

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
      Provider.of<Flashcards>(context, listen: false)
          .fetchAndSetFlashcardsForReview()
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
    final _loadedFlashcards = Provider.of<Flashcards>(context, listen: false);
    final firstThreeFlashcards = _loadedFlashcards.items.take(3).toList();
    final appBar = AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.08,
      title: Text("Review"),
      elevation: 0.1,
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
          children: <Widget>[
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    child: Text(
                      "Review the questions you have studied before",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height) *
                        0.015,
                  ),
                  FittedBox(
                    child: Text(
                      "The more you answer a question correctly, the less often you have to review it",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.02,
            ),
            Container(
              child: Text(
                "You've got ${_loadedFlashcards.items.length} questions to review",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.02,
            ),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        child: Text(
                          "Upcoming questions:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) *
                            0.02,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorLight,
                              width: 3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) *
                            0.15,
                        width: (MediaQuery.of(context).size.width) * 0.9,
                        child: firstThreeFlashcards.length > 0
                            ? AutoSizeText(
                                firstThreeFlashcards[0].question,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : Text(""),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) *
                            0.02,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorLight,
                              width: 3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) *
                            0.15,
                        width: (MediaQuery.of(context).size.width) * 0.9,
                        child: firstThreeFlashcards.length >= 2
                            ? AutoSizeText(
                                firstThreeFlashcards[1].question,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : Text(""),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) *
                            0.02,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorLight,
                              width: 3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) *
                            0.15,
                        width: (MediaQuery.of(context).size.width) * 0.9,
                        child: firstThreeFlashcards.length >= 3
                            ? AutoSizeText(
                                firstThreeFlashcards[2].question,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : Text(""),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) *
                            0.015,
                      ),
                    ],
                  ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.005,
            ),
            Center(
              child: FloatingActionButton(
                onPressed: _loadedFlashcards.items.length == 0
                    ? () {}
                    : () => changePage(),
                splashColor: Colors.white,
                child: Text(
                  "Go",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
