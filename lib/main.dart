import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/flashcards.dart';
import "./models/flashcard.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mainsights',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Mode: Accounting'),
      ),
      body: Flashcards(),
    );
  }
}
