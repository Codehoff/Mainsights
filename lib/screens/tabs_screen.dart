import 'package:flutter/material.dart';

import './searchscreen.dart';
import "./reviewchoosecategoryscreen.dart";
import "./studyscreen.dart";

class TabsScreen extends StatefulWidget {
  static const routeName = "/tabsscreen";
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': Studyscreen(),
      'title': 'Study',
    },
    {
      'page': Searchscreen(),
      'title': 'Search',
    },
    {
      'page': ReviewChooseCategoryScreen(),
      'title': 'Review',
    },
  ];

  int _selectedPageIndex = 2;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.book),
            title: Text('Study'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.rate_review),
            title: Text('Review'),
          ),
        ],
      ),
    );
  }
}
