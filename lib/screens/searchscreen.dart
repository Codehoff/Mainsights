import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../providers/flashcards.dart";

class Searchscreen extends StatelessWidget {
  static const routeName = "/search";

  @override
  Widget build(BuildContext context) {
    void _pushFlashcards() {
      Provider.of<Flashcards>(context).pushFlashcards();
    }

    return Column(children: [
      Container(
        child: SizedBox(
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
      ),
    ]);
  }
}
