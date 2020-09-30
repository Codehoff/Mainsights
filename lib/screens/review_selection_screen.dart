import "package:flutter/material.dart";
import "package:provider/provider.dart";

import '../widgets/main_drawer.dart';
import 'review_screen.dart';
import "../providers/localFlashcards.dart";

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
      Provider.of<LocalFlashcards>(context)
          .fetchAndSetLocalFlashcardsForReview()
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
    final _loadedFlashcards = Provider.of<LocalFlashcards>(context);
    final firstThreeFlashcards = _loadedFlashcards.items.take(3).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Mode"),
        elevation: 0.1,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    "You've got ${_loadedFlashcards.items.length} questions to review"),
          ),
          SizedBox(
            height: 30,
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
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 80,
                      width: 300,
                      child: firstThreeFlashcards.length > 0
                          ? Text(
                              firstThreeFlashcards[0].question,
                              style: TextStyle(fontSize: 18),
                            )
                          : Text(""),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 80,
                      width: 300,
                      child: firstThreeFlashcards.length >= 2
                          ? Text(
                              firstThreeFlashcards[1].question,
                              style: TextStyle(fontSize: 18),
                            )
                          : Text(""),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 80,
                      width: 300,
                      child: firstThreeFlashcards.length >= 3
                          ? Text(
                              firstThreeFlashcards[2].question,
                              style: TextStyle(fontSize: 18),
                            )
                          : Text(""),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
          Center(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: _loadedFlashcards.items.length == 0
                  ? () {}
                  : () => changePage(),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              splashColor: Colors.white,
              child: Text(
                "Go",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
