import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

import 'review_screen.dart';

class ReviewChooseCategoryScreen extends StatefulWidget {
  static const routeName = "/reviewchoosecategory";
  @override
  _ReviewChooseCategoryScreenState createState() =>
      _ReviewChooseCategoryScreenState();
}

class _ReviewChooseCategoryScreenState
    extends State<ReviewChooseCategoryScreen> {
  String dropdownValue = "Accounting";

  void changePage(dropdownValue) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Reviewscreen(
          dropdownValue: dropdownValue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review: Choose Category"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "What do you want to study today?",
            style: TextStyle(fontSize: 22),
          )),
          SizedBox(
            height: 40,
          ),
          DropdownButton(
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            dropdownColor: Theme.of(context).primaryColor,
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>["Accounting", "Process", "Valuation"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(
            height: 25,
          ),
          FloatingActionButton(
            onPressed: () => changePage(dropdownValue),
            backgroundColor: Theme.of(context).primaryColor,
            splashColor: Colors.white,
            child: Text(
              "Go",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}