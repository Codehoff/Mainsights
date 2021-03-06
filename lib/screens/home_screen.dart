import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/chart.dart';
import "package:provider/provider.dart";
import "package:pie_chart/pie_chart.dart";
import "../providers/auth2.dart";

import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import "../providers/flashcards.dart";
import "../widgets/chart_horizontal.dart";

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Flashcards>(context, listen: false)
          .fetchAllFlashcards()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Home'),
    );

    final loadedFlashcards = Provider.of<Flashcards>(context, listen: false);

    final flashcards = loadedFlashcards.items;
    final solvedFlashcards =
        loadedFlashcards.items.where((element) => element.points > 0);

    final accountingFlashcards = loadedFlashcards.items
        .where((element) => element.category == "Accounting");
    final solvedAccountingFlashcards = loadedFlashcards.items.where(
        (element) => element.category == "Accounting" && element.points > 0);

    final valuationFlashcards = loadedFlashcards.items
        .where((element) => element.category == "Valuation");
    final solvedValuationFlashcards = loadedFlashcards.items.where(
        (element) => element.category == "Valuation" && element.points > 0);

    final processFlashcards = loadedFlashcards.items
        .where((element) => element.category == "Process");
    final solvedProcessFlashcards = loadedFlashcards.items.where(
        (element) => element.category == "Process" && element.points > 0);

    final reviewedThisWeek = loadedFlashcards.items.where((element) =>
        DateTime.now().difference(DateTime.parse(element.lastReviewed)).inDays <
        7);

    var reviewedString = "";

    Map<String, double> pieChart = {
      "Accounting": solvedAccountingFlashcards.length.toDouble(),
      "Valuation": solvedValuationFlashcards.length.toDouble(),
      "Process": solvedProcessFlashcards.length.toDouble(),
    };

    if (reviewedThisWeek.length > 7) {
      reviewedString = "awesome!";
    } else if (reviewedThisWeek.length > 0) {
      reviewedString = "great!";
    } else {
      reviewedString = "get started now!";
    }

    return Scaffold(
      appBar: appBar,
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "You have reviewed ${reviewedThisWeek.length} Flashcards in the last 7 days, $reviewedString ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Flashcard Progress:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ChartHorizontal(
                        "Accounting",
                        solvedAccountingFlashcards.length,
                        accountingFlashcards.length,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ChartHorizontal(
                        "Valuation",
                        solvedValuationFlashcards.length,
                        valuationFlashcards.length,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ChartHorizontal(
                        "Process",
                        solvedProcessFlashcards.length,
                        processFlashcards.length,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ChartHorizontal(
                        "Overall",
                        solvedFlashcards.length,
                        flashcards.length,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Level Progress:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Accounting",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Chart(accountingFlashcards.toList()),
                      Text(
                        "Valuation",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Chart(valuationFlashcards.toList()),
                      Text(
                        "Process",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Chart(processFlashcards.toList()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Review Ratio:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: PieChart(
                          dataMap: pieChart,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          colorList: [
                            Color(0xff075B9A),
                            Color(0xff90C2E7),
                            Color(0xff00A9A5)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
