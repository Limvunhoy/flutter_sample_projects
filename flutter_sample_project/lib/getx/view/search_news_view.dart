import 'package:flutter/material.dart';
import 'package:flutter_sample_project/getx/core/drawer.dart';

class SearchNewsView extends StatefulWidget {
  @override
  _SearchNewsViewState createState() => _SearchNewsViewState();
}

class _SearchNewsViewState extends State<SearchNewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Demo"),
        backgroundColor: Colors.red.shade900,
      ),
      drawer: appDrawer(),
    );
  }
}