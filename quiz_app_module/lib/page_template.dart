import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  List<Color> backgroundColorsList = [
    Colors.deepOrange,
    Colors.deepPurple,
  ];
  Widget? pageWidget ;
  PageTemplate({super.key, List<Color>? backgroundColorsList, this.pageWidget}) {
    this.backgroundColorsList =
        backgroundColorsList ?? this.backgroundColorsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundColorsList,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: pageWidget,
      ),
    );
  }
}
