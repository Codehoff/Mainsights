import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../providers/flashcards.dart";
import "../providers/localFlashcards.dart";
import "../helpers/dbhelper.dart";

class Searchscreen extends StatelessWidget {
  static const routeName = "/search";

  @override
  Widget build(BuildContext context) {
    /////push online/////
    void _pushFlashcards() {
      Provider.of<Flashcards>(context).pushFlashcards();
    }

    /////push local/////
    void _pushLocalFlashcards() {
      Provider.of<LocalFlashcards>(context).pushLocalFlashcard();
    }

    /////Drop local/////
    void _dropLocalDB() {
      DBHelper.dropDB();
    }

    return Column(children: [
      SizedBox(
        height: 50,
      ),
      SizedBox(
        width: 200,
        height: 60,
        child: FlatButton(
          color: Colors.red,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: _pushFlashcards,
          child: Text(
            "Push to Server",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
      SizedBox(
        width: 200,
        height: 60,
        child: FlatButton(
          color: Colors.red,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: _pushLocalFlashcards,
          child: Text(
            "Push to local ",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      SizedBox(
        width: 200,
        height: 60,
        child: FlatButton(
          color: Colors.red,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: _dropLocalDB,
          child: Text(
            "Drop local DB",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),
    ]);
  }
}
