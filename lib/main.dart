import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/dashboardscreen.dart';
import 'package:flutter_complete_guide/screens/reviewscreen.dart';
import 'package:flutter_complete_guide/screens/searchscreen.dart';
import 'package:flutter_complete_guide/screens/studyscreen.dart';
import 'package:flutter_complete_guide/screens/tabsscreen.dart';

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
          "/": (ctx) => DashboardScreen(),
          DashboardScreen.routeName: (ctx) => DashboardScreen(),
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
      body: Text("data"),
    );
  }
}
