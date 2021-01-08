import 'package:flutter/material.dart';

import './chart_bar.dart';
import "../models/flashcard.dart";

class Chart extends StatelessWidget {
  final List<Flashcard> flashcards;

  Chart(this.flashcards);

  @override
  Widget build(BuildContext context) {
    final amountLevel1 = flashcards.where((element) => element.level == 1);
    final amountLevel2 = flashcards.where((element) => element.level == 2);
    final amountLevel3 = flashcards.where((element) => element.level == 3);
    final amountLevel4 = flashcards.where((element) => element.level == 4);
    final amountLevel5 = flashcards.where((element) => element.level == 5);

    return Card(
      color: Theme.of(context).primaryColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                1,
                amountLevel1.length,
                amountLevel1.length / flashcards.length,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                2,
                amountLevel2.length,
                amountLevel2.length / flashcards.length,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                3,
                amountLevel3.length,
                amountLevel3.length / flashcards.length,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                4,
                amountLevel4.length,
                amountLevel4.length / flashcards.length,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                5,
                amountLevel5.length,
                amountLevel5.length / flashcards.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
