import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/local_flashcards_show.dart';
import "package:provider/provider.dart";

import '../providers/flashcards.dart';
import "../widgets/main_drawer.dart";

class Reviewscreen extends StatefulWidget {
  static const routeName = "/reviewscreen";
  final String dropdownValue1;
  final String dropdownValue2;
  final String dropdownValue3;
  final String dropdownValue4;

  const Reviewscreen(
      {this.dropdownValue1,
      this.dropdownValue2,
      this.dropdownValue3,
      this.dropdownValue4});

  @override
  _ReviewscreenState createState() => _ReviewscreenState(
      dropdownValue1, dropdownValue2, dropdownValue3, dropdownValue4);
}

class _ReviewscreenState extends State<Reviewscreen> {
  var _isInit = true;
  var _isLoading = false;

  String dropdownValue1;
  String dropdownValue2;
  String dropdownValue3;
  String dropdownValue4;

  _ReviewscreenState(this.dropdownValue1, this.dropdownValue2,
      this.dropdownValue3, this.dropdownValue4);

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
          .fetchAndSetFlashcardsForReview()
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
    final appBar = AppBar(
      title: Text('Review Mode'),
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
          : Container(
              height: MediaQuery.of(context).size.height -
                  appBar.preferredSize.height,
              child: LocalFlashcardsShow(),
            ),
    );
  }
}
