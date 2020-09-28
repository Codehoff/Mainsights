import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

import 'review_selection_screen.dart';

class FlashcardsFinishedScreen extends StatelessWidget {
  static const routeName = "/finished";
  const FlashcardsFinishedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _goBack() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewSelectionScreen()),
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
          SizedBox(
            height: 30,
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
