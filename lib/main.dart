import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/flashcards.dart';
import 'package:flutter_complete_guide/screens/auth_screen.dart';
import 'package:flutter_complete_guide/screens/search_selection_screen.dart';
import 'package:flutter_complete_guide/screens/settings_screen.dart';
import 'package:flutter_complete_guide/screens/study_selection_screen.dart';
import 'package:provider/provider.dart';

import "./screens/splash_screen.dart";
import './providers/auth.dart';
import 'screens/review_screen.dart';
import 'screens/search_list_screen.dart';
import 'screens/study_list_screen.dart';
import 'screens/review_selection_screen.dart';
import "./providers/localFlashcards.dart";
import "./screens/search_single_flashcard.dart";
import "./screens/welcome_screen.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: LocalFlashcards(),
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
            debugShowCheckedModeBanner: false,
            title: 'Mainsights',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: auth.isAuth
                ? StudySelectionScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen(),
                  ),
            routes: {
              AuthScreen.routeName: (ctx) => AuthScreen(),
              SearchSelectionScreen.routeName: (ctx) => SearchSelectionScreen(),
              StudySelectionScreen.routeName: (ctx) => StudySelectionScreen(),
              ReviewSelectionScreen.routeName: (ctx) => ReviewSelectionScreen(),
              StudyListScreen.routeName: (ctx) => StudyListScreen(),
              SearchListScreen.routeName: (ctx) => SearchListScreen(),
              Reviewscreen.routeName: (ctx) => Reviewscreen(),
              SettingsScreen.routeName: (ctx) => SettingsScreen(),
              SplashScreen.routeName: (ctx) => SplashScreen()
            }),
      ),
    );
  }
}
