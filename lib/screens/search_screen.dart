import "package:flutter/material.dart";

import "../widgets/main_drawer.dart";

class Searchscreen extends StatelessWidget {
  static const routeName = "/search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Mode"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Center(
        child: Text("Search Mode"),
      ),
    );
  }
}
