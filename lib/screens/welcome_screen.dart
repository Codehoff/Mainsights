import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter_complete_guide/screens/study_selection_screen.dart';
import "package:provider/provider.dart";

import "../widgets/main_drawer.dart";
import "../providers/localFlashcards.dart";

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
    Container(height: 300, color: Colors.amber),
    Container(height: 300, color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
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
            count: 2,
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
