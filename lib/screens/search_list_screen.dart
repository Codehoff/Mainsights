import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:flutter/services.dart';

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
    final appBar = AppBar(
      title: Text('Search Mode'),
    );

    return Scaffold(
      appBar: appBar,
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
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height) *
                      0.02,
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
                      FittedBox(
                        child: Text(
                          "There are ${flashcards.length} questions that match your selection criteria:",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        child: Text(
                          "Click on a question to see the answer",
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          FittedBox(
                            child: Text(
                              "Category 1",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.22,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: FittedBox(
                              child: Text(
                                dropdownValue1,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          FittedBox(
                            child: Text(
                              "Category 2",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.22,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: FittedBox(
                              child: Text(
                                dropdownValue2,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          FittedBox(
                            child: Text(
                              "Difficulty",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.22,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: FittedBox(
                              child: Text(
                                dropdownValue3,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          FittedBox(
                            child: FittedBox(
                              child: Text(
                                "Viewed",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.22,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: FittedBox(
                              child: Text(
                                dropdownValue4,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height) *
                      0.02,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              SearchSingleFlashcardScreen.routeName,
                              arguments: flashcards[index].id);
                          HapticFeedback.lightImpact();
                        },
                        child: Container(
                          height: 150,
                          margin: new EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            border: new Border(
                              bottom: new BorderSide(),
                            ),
                          ),
                          child: ListTile(
                            trailing: flashcards[index].viewed == "not viewed"
                                ? Text("")
                                : Icon(Icons.check),
                            title: Text(
                              flashcards[index].question,
                              style: TextStyle(fontSize: 18),
                            ),
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
