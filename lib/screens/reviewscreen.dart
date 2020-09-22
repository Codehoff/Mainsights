import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/flashcards_show.dart';

import 'package:provider/provider.dart';

import "../providers/flashcards.dart";

class Reviewscreen extends StatefulWidget {
  static const routeName = "/reviewscreen";
  final String dropdownValue;

  const Reviewscreen({this.dropdownValue});

  @override
  _ReviewsceenState createState() => _ReviewsceenState(dropdownValue);
}

class _ReviewsceenState extends State<Reviewscreen> {
  var _isInit = true;
  var _isLoading = false;
  var switched = false;
  var counter = 0;
  String dropdownValue;

  _ReviewsceenState(this.dropdownValue);

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
      Provider.of<Flashcards>(context)
          .fetchAndSetFlashcards(dropdownValue.toLowerCase())
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Review Mode'),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : FlashcardsShow());
  }
}
