import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import "package:provider/provider.dart";

import '../providers/flashcards.dart';
import '../providers/localFlashcards.dart';
import '../helpers/dbhelper.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = "/settings";

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

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            height: 60,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {},
              child: Text(
                "Nothing here yet",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ]),
      ),
    );
  }
}
