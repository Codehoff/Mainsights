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
  List<String> _categories = ["Choose category"];
  List<String> _subcategories = ["All"];
  String _selectedCategories = "Choose category";
  String _selectedSubcategory = "All";

  String dropdownValue1 = "Accounting";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Study"),
        elevation: 0.1,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text("Choose categories"),
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
              DropdownButton<String>(
                isExpanded: true,
                items: <String>["All", "Basic", "Intermediate", "Advanced"]
                    .map((String dropdownValue3) {
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
                height: 80,
              ),
              FloatingActionButton(
                onPressed: () => changePage(dropdownValue1, dropdownValue2),
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
