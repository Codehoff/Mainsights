import "package:flutter/material.dart";
import "package:provider/provider.dart";

import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import "../providers/localFlashcards.dart";
import "../screens/search_single_flashcard.dart";

class SearchListScreen extends StatefulWidget {
  static const routeName = "/SearchListScreen";

  final String dropdownValue1;
  final String dropdownValue2;
  final String dropdownValue3;
  final String dropdownValue4;
  final String searchValue;

  final String id;

  const SearchListScreen(
      {this.id,
      this.dropdownValue1,
      this.dropdownValue2,
      this.dropdownValue3,
      this.dropdownValue4,
      this.searchValue});

  @override
  _SearchListScreenState createState() => _SearchListScreenState(
      id,
      dropdownValue1,
      dropdownValue2,
      dropdownValue3,
      dropdownValue4,
      searchValue);
}

class _SearchListScreenState extends State<SearchListScreen> {
  var _isInit = true;
  var _isLoading = false;
  String dropdownValue1;
  String dropdownValue2;
  String dropdownValue3;
  String dropdownValue4;
  String searchValue;
  String id;

  _SearchListScreenState(this.id, this.dropdownValue1, this.dropdownValue2,
      this.dropdownValue3, this.dropdownValue4, this.searchValue);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<LocalFlashcards>(context)
          .fetchAndSetLocalFlashcards(dropdownValue1, dropdownValue2,
              dropdownValue3, dropdownValue4, searchValue)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loadedFlashcards = Provider.of<LocalFlashcards>(context);
    final flashcards = loadedFlashcards.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Mode'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  "These are the questions based on your selection criteria:",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Category 1",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 90,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              dropdownValue1,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Category 2",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 90,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              dropdownValue2,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Difficulty",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 90,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              dropdownValue3,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Viewed",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 90,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              dropdownValue4,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Container(
                        height: 150,
                        margin: new EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          border: new Border(
                            bottom: new BorderSide(),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                SearchSingleFlashcardScreen.routeName,
                                arguments: flashcards[index].id);
                          },
                          trailing: flashcards[index].viewed == "not viewed"
                              ? Text("")
                              : Icon(Icons.check),
                          title: Text(
                            flashcards[index].question,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                    itemCount: flashcards.length,
                  ),
                ),
              ],
            ),
    );
  }
}
