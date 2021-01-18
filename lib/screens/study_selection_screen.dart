import "package:flutter/material.dart";

import "../widgets/main_drawer.dart";
import "../category_repo.dart";
import "../screens/study_list_screen.dart";

class StudySelectionScreen extends StatefulWidget {
  static const routeName = "/Studyselection";
  @override
  _StudySelectionScreenState createState() => _StudySelectionScreenState();
}

class _StudySelectionScreenState extends State<StudySelectionScreen> {
  List<String> _categories = ["All"];
  List<String> _subcategories = ["All"];
  String _selectedCategories = "All";
  String _selectedSubcategory = "All";

  String dropdownValue1 = "All";
  String dropdownValue2 = "All";
  String dropdownValue3 = "All";
  String dropdownValue4 = "All";

  void changePage(dropdownValue1, dropdownValue2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudyListScreen(
            dropdownValue1: dropdownValue1,
            dropdownValue2: dropdownValue2,
            dropdownValue3: dropdownValue3,
            dropdownValue4: dropdownValue4),
      ),
    );
  }

  @override
  void initState() {
    _categories = List.from(_categories)..addAll(CategoryRepo().getNames());
    super.initState();
  }

  final appBar = AppBar(
    title: Text("Study"),
    elevation: 0.1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: appBar,
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height) *
                      0.02,
                ),
                Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height) *
                      0.15,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          "Enter your search terms below",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) *
                            0.02,
                      ),
                      FittedBox(
                        child: Text(
                          "In case you want to specify your search results, choose the respective chapter",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Category",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) *
                            0.02,
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        items: _categories.map((String dropdownValue1) {
                          return DropdownMenuItem<String>(
                            value: dropdownValue1,
                            child: Text(dropdownValue1),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _onSelectedCategory(value);
                          dropdownValue1 = value;
                        },
                        value: _selectedCategories,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Subcategory",
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        items: _subcategories.map((String dropdownValue2) {
                          return DropdownMenuItem<String>(
                            value: dropdownValue2,
                            child: Text(dropdownValue2),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _onSelectedSubcategory(value);
                          dropdownValue2 = value;
                        },
                        value: _selectedSubcategory,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Difficulty",
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        items: <String>[
                          "All",
                          "Basic",
                          "Intermediate",
                          "Advanced"
                        ].map((String dropdownValue3) {
                          return DropdownMenuItem<String>(
                            value: dropdownValue3,
                            child: Text(dropdownValue3),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue3 = newValue;
                          });
                        },
                        value: dropdownValue3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Viewed / Not viewed",
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        items: <String>["All", "Not viewed", "Viewed"]
                            .map((String dropdownValue4) {
                          return DropdownMenuItem<String>(
                            value: dropdownValue4,
                            child: Text(dropdownValue4),
                          );
                        }).toList(),
                        onChanged: (String newerValue) {
                          setState(() {
                            dropdownValue4 = newerValue;
                          });
                        },
                        value: dropdownValue4,
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) *
                            0.1,
                      ),
                      FloatingActionButton(
                        onPressed: () =>
                            changePage(dropdownValue1, dropdownValue2),
                        backgroundColor: Theme.of(context).primaryColor,
                        splashColor: Colors.white,
                        child: Text(
                          "Go",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onSelectedCategory(String value) {
    setState(() {
      _selectedSubcategory = "All";
      _subcategories = ["All"];
      _selectedCategories = value;
      _subcategories = List.from(_subcategories)
        ..addAll(CategoryRepo().getSubcategoyByCategory(value));
    });
    return value;
  }

  _onSelectedSubcategory(String value) {
    setState(() => _selectedSubcategory = value);
  }
}
