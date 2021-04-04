import 'package:flutter/material.dart';
import 'package:flutter_sample_project/getx/core/drawer.dart';

class NewsHeadlineView extends StatefulWidget {
  @override
  _NewsHeadlineViewState createState() => _NewsHeadlineViewState();
}

class _NewsHeadlineViewState extends State<NewsHeadlineView> {
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
