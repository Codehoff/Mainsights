import "package:flutter/material.dart";

import "../widgets/main_drawer.dart";
import "../category_repo.dart";
import "../screens/search_list_screen.dart";

class SearchSelectionScreen extends StatefulWidget {
  static const routeName = "/Searchselection";
  @override
  _SearchSelectionScreenState createState() => _SearchSelectionScreenState();
}

class _SearchSelectionScreenState extends State<SearchSelectionScreen> {
  List<String> _categories = ["All"];
  List<String> _subcategories = ["All"];
  String _selectedCategories = "All";
  String _selectedSubcategory = "All";

  String searchValue = "Test";
  String dropdownValue1 = "All";
  String dropdownValue2 = "All";
  String dropdownValue3 = "All";
  String dropdownValue4 = "All";

  void changePage(dropdownValue1, dropdownValue2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchListScreen(
            dropdownValue1: dropdownValue1,
            dropdownValue2: dropdownValue2,
            dropdownValue3: dropdownValue3,
            dropdownValue4: dropdownValue4,
            searchValue: searchValue),
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
        title: Text("Search"),
        elevation: 0.1,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  "Choose your search criteria below",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "In case you want to specify your search results, choose the respective chapter",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: TextFormField(
                decoration: InputDecoration(hintText: "e.g. comps"),
                initialValue: "",
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  searchValue = value;
                }),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Column(
                children: <Widget>[
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
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
                    height: 25,
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
        ],
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
