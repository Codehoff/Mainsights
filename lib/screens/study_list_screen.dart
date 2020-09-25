import "package:flutter/material.dart";

import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class StudyListScreen extends StatefulWidget {
  static const routeName = "/StudyListScreen";

  final String dropdownValue1;
  final String dropdownValue2;
  final String dropdownValue3;
  final String dropdownValue4;

  const StudyListScreen(
      {this.dropdownValue1,
      this.dropdownValue2,
      this.dropdownValue3,
      this.dropdownValue4});

  @override
  _StudyListScreenState createState() => _StudyListScreenState(
      dropdownValue1, dropdownValue2, dropdownValue3, dropdownValue4);
}

class _StudyListScreenState extends State<StudyListScreen> {
  String dropdownValue1;
  String dropdownValue2;
  String dropdownValue3;
  String dropdownValue4;

  _StudyListScreenState(this.dropdownValue1, this.dropdownValue2,
      this.dropdownValue3, this.dropdownValue4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Mode'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "These are the questions based on your selection criteria:",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
