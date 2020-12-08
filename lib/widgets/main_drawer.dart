import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import "../screens/study_selection_screen.dart";
import '../screens/review_selection_screen.dart';
import '../screens/search_selection_screen.dart';
import "../screens/settings_screen.dart";
import "../providers/auth.dart";

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "TODO: Username",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Search', Icons.find_in_page, () {
            Navigator.of(context)
                .pushReplacementNamed(SearchSelectionScreen.routeName);
          }),
          buildListTile('Study', Icons.laptop_chromebook, () {
            Navigator.of(context)
                .pushReplacementNamed(StudySelectionScreen.routeName);
          }),
          buildListTile('Review', Icons.playlist_add_check, () {
            Navigator.of(context)
                .pushReplacementNamed(ReviewSelectionScreen.routeName);
          }),
          buildListTile('Settings', Icons.settings, () {
            Navigator.of(context)
                .pushReplacementNamed(SettingsScreen.routeName);
          }),
          buildListTile('Logout', Icons.exit_to_app, () {
            Navigator.of(context).pop();
            Provider.of<Auth>(context, listen: false).logout();
          }),
        ],
      ),
    );
  }
}
