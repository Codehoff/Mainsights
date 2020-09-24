import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/local_flashcards_show.dart';
import "package:provider/provider.dart";

import "../providers/localFlashcards.dart";

class Studyscreen extends StatefulWidget {
  static const routeName = "/studyscreen";
  final String dropdownValue;

  const Studyscreen({this.dropdownValue});

  @override
  _StudyscreenState createState() => _StudyscreenState();
}

class _StudyscreenState extends State<Studyscreen> {
  var _isInit = true;
  var _isLoading = false;

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
          .fetchAndSetLocalFlashcards()
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
          : LocalFlashcardsShow(),
    );
  }
}
