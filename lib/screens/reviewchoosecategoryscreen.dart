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

  void changePage(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return Reviewscreen(dropdownValue);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Study Selection'),
        ),
        body: Column(
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
            InkWell(
              onTap: () => changePage,
              child: Container(
                color: Colors.green,
                child: Text(
                  "Print",
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
            ),
          ],
        ));
  }
}
