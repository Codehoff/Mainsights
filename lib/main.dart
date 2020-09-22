import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/flashcards.dart';
import 'package:flutter_complete_guide/screens/authscreen.dart';
import 'package:provider/provider.dart';

import "./screens/splash_screen.dart";
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
          ChangeNotifierProxyProvider<Auth, Flashcards>(
            create: null,
            update: (ctx, auth, previousFlashcards) => Flashcards(
                auth.token,
                auth.userId,
                previousFlashcards == null ? [] : previousFlashcards.items),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
              title: 'Mainsights',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: auth.isAuth
                  ? TabsScreen()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : AuthScreen(),
                    ),
              routes: {
                ReviewChooseCategoryScreen.routeName: (ctx) =>
                    ReviewChooseCategoryScreen(),
                Studyscreen.routeName: (ctx) => Studyscreen(),
                Searchscreen.routeName: (ctx) => Searchscreen(),
                Reviewscreen.routeName: (ctx) => Reviewscreen(),
                TabsScreen.routeName: (ctx) => TabsScreen(),
              }),
        ));
  }
}
