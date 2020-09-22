import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/flashcards_show.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:provider/provider.dart';

import "../models/flashcard.dart";
import '../providers/flashcards.dart';

class Studyscreen extends StatefulWidget {
  static const routeName = "/studyscreen";

  @override
  _ReviewsceenState createState() => _ReviewsceenState();
}

class _ReviewsceenState extends State<Studyscreen> {
  @override
  Widget build(BuildContext context) {
    return FlashcardsShow();
  }
}
