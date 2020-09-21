import "package:flutter/material.dart";

class DashboardScreen extends StatefulWidget {
  static const routeName = "/dashboard";
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String dropdownValue = "Accounting";

  void _changePage() {
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
            SizedBox(
              width: 70,
              height: 20,
              child: FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(2.0),
                splashColor: Colors.blueAccent,
                onPressed: _changePage,
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
