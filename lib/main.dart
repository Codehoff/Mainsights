import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/authscreen.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import 'package:flutter_complete_guide/screens/reviewscreen.dart';
import 'package:flutter_complete_guide/screens/searchscreen.dart';
import 'package:flutter_complete_guide/screens/studyscreen.dart';
import 'package:flutter_complete_guide/screens/tabsscreen.dart';
import 'package:flutter_complete_guide/screens/reviewchoosecategoryscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
          title: 'Mainsights',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: "/",
          routes: {
            "/": (ctx) => AuthScreen(),
            ReviewChooseCategoryScreen.routeName: (ctx) =>
                ReviewChooseCategoryScreen(),
            Studyscreen.routeName: (ctx) => Studyscreen(),
            Searchscreen.routeName: (ctx) => Searchscreen(),
            Reviewscreen.routeName: (ctx) => Reviewscreen(),
          }),
    );
  }
}
