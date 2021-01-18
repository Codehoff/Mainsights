import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/flashcards.dart';
import 'package:flutter_complete_guide/screens/auth_screen.dart';
import 'package:flutter_complete_guide/screens/home_screen.dart';
import 'package:flutter_complete_guide/screens/search_selection_screen.dart';
import 'package:flutter_complete_guide/screens/tutorial_screen.dart';
import 'package:flutter_complete_guide/screens/study_selection_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import "./screens/auth_screen.dart";
import "./screens/splash_screen.dart";
import './providers/auth2.dart';
import 'screens/review_screen.dart';
import 'screens/search_list_screen.dart';
import 'screens/study_list_screen.dart';
import 'screens/review_selection_screen.dart';
import "screens/welcome_screen.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
        ),
        ChangeNotifierProxyProvider<AuthenticationProvider, Flashcards>(
          create: null,
          update: (ctx, auth, previousFlashcards) => Flashcards(
              auth.token,
              auth.userId,
              previousFlashcards == null ? [] : previousFlashcards.items),
        ),
      ],
      child: Consumer<AuthenticationProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mainsights',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Authenticate(),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            LogInPage.routeName: (ctx) => LogInPage(),
            SearchSelectionScreen.routeName: (ctx) => SearchSelectionScreen(),
            StudySelectionScreen.routeName: (ctx) => StudySelectionScreen(),
            ReviewSelectionScreen.routeName: (ctx) => ReviewSelectionScreen(),
            StudyListScreen.routeName: (ctx) => StudyListScreen(),
            SearchListScreen.routeName: (ctx) => SearchListScreen(),
            Reviewscreen.routeName: (ctx) => Reviewscreen(),
            TutorialScreen.routeName: (ctx) => TutorialScreen(),
            WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
            SplashScreen.routeName: (ctx) => SplashScreen()
          },
        ),
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Instance to know the authentication state.
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      //Means that the user is logged in already and hence navigate to HomePage
      return HomeScreen();
    }
    //The user isn't logged in and hence navigate to SignInPage.
    return LogInPage();
  }
}
