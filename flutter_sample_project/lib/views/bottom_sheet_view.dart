import 'package:flutter/material.dart';
import 'package:flutter_sample_project/models/list_tile_model.dart';

class TestingView extends StatelessWidget {
  const TestingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class BottomSheetView extends StatelessWidget {
  final String title;

  const BottomSheetView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.red.shade900,
                onPressed: () {
                  _openBottomSheet(context);
                },
                child: Text(
                  "Show Bottom Sheet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        builder: (build) {
          return Container(
            padding: EdgeInsets.all(5.0),
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: Wrap(
              children: [
                getListTile(Icons.more, Colors.red.shade900, "More", context,
                    SheetType.more),
                getListTile(Icons.favorite, Colors.red.shade900, "Favorites",
                    context, SheetType.favorite),
                getListTile(
                  Icons.account_box,
                  Colors.red.shade900,
                  "Profile",
                  context,
                  SheetType.profile,
                ),
                Divider(
                  thickness: 2.0,
                  height: 10.0,
                ),
                getListTile(Icons.exit_to_app, Colors.grey, "Logout", context,
                    SheetType.logout),
              ],
            ),
          );
        });
  }
}
