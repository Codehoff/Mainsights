import "package:flutter/material.dart";

class IntroCards extends StatelessWidget {
  final List<Widget> introCards = [
    Container(
      height: 300,
      color: Colors.amber,
      child: Column(
        children: [
          Text(
              "Welcome to Mainsights, this short introduction slideshow will help get you started. If you know your way around, you can just skip it by pressing 'Get Started'"),
        ],
      ),
    ),
    Container(
      height: 300,
      color: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Text("Hello");
  }
}
