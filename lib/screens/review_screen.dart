import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/local_flashcards_show.dart';
import "package:provider/provider.dart";

import '../providers/localFlashcards.dart';

class Reviewscreen extends StatefulWidget {
  static const routeName = "/reviewscreen";
  final String dropdownValue;

  const Reviewscreen({this.dropdownValue});

  @override
  _ReviewscreenState createState() => _ReviewscreenState(dropdownValue);
}

class _ReviewscreenState extends State<Reviewscreen> {
  var _isInit = true;
  var _isLoading = false;

  String dropdownValue;

  _ReviewscreenState(this.dropdownValue);

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
          .fetchAndSetLocalFlashcards(dropdownValue)
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
