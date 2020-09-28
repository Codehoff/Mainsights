import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/flashcards.dart';
import 'package:flutter_complete_guide/screens/auth_screen.dart';
import 'package:flutter_complete_guide/screens/settings_screen.dart';
import 'package:flutter_complete_guide/screens/study_selection_screen.dart';
import 'package:flutter_complete_guide/screens/study_single_flashcard_screen.dart';
import 'package:provider/provider.dart';

import "./screens/splash_screen.dart";
import './providers/auth.dart';
import 'screens/review_screen.dart';
import 'screens/search_list_screen.dart';
import 'screens/study_list_screen.dart';
import "./screens/flashcards_finished_screen.dart";
import 'screens/review_choose_category_screen.dart';
import "./providers/localFlashcards.dart";

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
              title: 'Mainsights',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: auth.isAuth
                  ? ReviewChooseCategoryScreen()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : AuthScreen(),
                    ),
              routes: {
                StudySelectionScreen.routeName: (ctx) => StudySelectionScreen(),
                ReviewChooseCategoryScreen.routeName: (ctx) =>
                    ReviewChooseCategoryScreen(),
                StudyListScreen.routeName: (ctx) => StudyListScreen(),
                SearchListScreen.routeName: (ctx) => SearchListScreen(),
                Reviewscreen.routeName: (ctx) => Reviewscreen(),
                FlashcardsFinishedScreen.routeName: (ctx) =>
                    FlashcardsFinishedScreen(),
                SettingsScreen.routeName: (ctx) => SettingsScreen(),
                StudySingleFlashcardScreen.routeName: (ctx) =>
                    StudySingleFlashcardScreen(),
              }),
        ));
  }
}
