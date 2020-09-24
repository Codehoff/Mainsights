import "package:flutter/material.dart";

import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class Studyscreen extends StatefulWidget {
  static const routeName = "/studyscreen";

  @override
  _StudyscreenState createState() => _StudyscreenState();
}

class _StudyscreenState extends State<Studyscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Study Mode'),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Center(
          child: Text("Study Mode"),
        ));
  }
}
