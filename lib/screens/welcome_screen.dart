import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter_complete_guide/screens/study_selection_screen.dart';
import "package:provider/provider.dart";

import "../widgets/main_drawer.dart";
import "../providers/localFlashcards.dart";
import "../widgets/intro_cards.dart";

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void _pushLocalFlashcards() {
    Provider.of<LocalFlashcards>(context).pushLocalFlashcard();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudySelectionScreen(),
      ),
    );
  }

  int pageIndex = 0;

  List<Widget> _demo = [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.blue[100],
      ),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome to Mainsights! \n\n This short introduction slideshow will help get you started. If you know your way around, you can just skip it by pressing \n 'Get Started'",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.blue[100],
      ),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "There are three modes - Study, Review, and Search",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.blue[100],
      ),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Study Mode: \n \n Here you can choose from different categories, subcategories and difficulties to study precisely what you need. \n \n Once you look at the answer, a flashcard is marked as 'viewed', and will be available in the Review Mode.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.blue[100],
      ),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Review Mode: \n\n Here you can review and memorize the flashcards that you first saw in Study Mode. \n\n The more often you know the correct answer for a certain flashcard, the less you will have to review it - and vice versa.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.blue[100],
      ),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Search Mode: \n\n Here you can search for specific flashcards using different filters.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Introduction"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 520.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) => setState(() {
                pageIndex = index;
              }),
            ),
            items: _demo,
          ),
          SizedBox(
            height: 10,
          ),
          CarouselIndicator(
            height: 10,
            count: 5,
            index: pageIndex,
            activeColor: Colors.blue[300],
            color: Colors.grey[300],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: _pushLocalFlashcards,
            child: Container(
              alignment: Alignment.center,
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(5),
              child: Text(
                "Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
