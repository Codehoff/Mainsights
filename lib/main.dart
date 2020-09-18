import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/reviewscreen.dart';
import 'package:flutter_complete_guide/screens/searchscreen.dart';
import 'package:flutter_complete_guide/screens/studyscreen.dart';
import 'package:flutter_complete_guide/screens/tabsscreen.dart';

import './widgets/flashcards.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mainsights',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (ctx) => TabsScreen(),
          Studyscreen.routeName: (ctx) => Studyscreen(),
          Searchscreen.routeName: (ctx) => Searchscreen(),
          Reviewscreen.routeName: (ctx) => Reviewscreen(),
        });
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
