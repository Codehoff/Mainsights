import "package:flutter/material.dart";
import 'package:flutter_complete_guide/screens/reviewscreen.dart';

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
    return Column(
      children: [
        Text("What do you want to study today?"),
        DropdownButton(
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
        GestureDetector(
          onTap: () => changePage(dropdownValue),
          child: Container(
            color: Colors.green,
            child: Text(
              "Print",
              style: TextStyle(fontSize: 13.0),
            ),
          ),
        ),
      ],
    );
  }
}
