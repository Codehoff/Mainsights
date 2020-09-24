import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/local_flashcards_show.dart';

class Studyscreen extends StatefulWidget {
  static const routeName = "/studyscreen";

  @override
  _StudyscreenState createState() => _StudyscreenState();
}

class _StudyscreenState extends State<Studyscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Review Mode'),
        ),
        body: Center(
          child: Text("Hello"),
        ));
  }
}
