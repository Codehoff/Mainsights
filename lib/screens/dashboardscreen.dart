import "package:flutter/material.dart";

class DashboardScreen extends StatefulWidget {
  static const routeName = "/dashboard";
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String dropdownValue = "Accounting";

  void _printValue() {
    print(dropdownValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Study Selection'),
        ),
        body: Column(
          children: [
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
                onPressed: _printValue,
                child: Text(
                  "Print Value",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
          ],
        ));
  }
}
