import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_project/models/screen_model.dart';
import 'package:flutter_sample_project/views/bottom_sheet_view.dart';
import 'package:flutter_sample_project/views/drop_down_view.dart';
import 'package:flutter_sample_project/views/fetch_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeView());
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Sample Project",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: Screens.values.length,
          itemBuilder: (context, index) {
            return listTile(Screens.values[index].toString(), context,
                Icons.navigate_next, Colors.grey, () {
              _onNavigateToScreen(context, Screens.values[index]);
            });
          },
        ),
      ),
    );
  }

  _onNavigateToScreen(BuildContext context, Screens screens) {
    switch (screens) {
      case Screens.BottomSheetView:
        _pushToScreen(
            context,
            BottomSheetView(
              title: "Bottom Sheet",
            ));
        break;
      case Screens.DropDownButton:
        _pushToScreen(context, DropDownView());
        break;
      case Screens.FetchDataSample:
        _pushToScreen(context, FetchDataSample());
    }
  }

  _pushToScreen(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
