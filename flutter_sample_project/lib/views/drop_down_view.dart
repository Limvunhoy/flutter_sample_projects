import 'package:flutter/material.dart';

class DropDownView extends StatefulWidget {
  @override
  _DropDownViewState createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  List _phoneBranch = ["Apple", "Samsung", "Sony", "XiaoMi", "HuaWei"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;

  String _selectItem;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_phoneBranch);
    _selectItem = _dropDownMenuItems.first.value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List branches) {
    List<DropdownMenuItem<String>> items = List();
    for (String branch in branches) {
      items.add(DropdownMenuItem(
        value: branch,
        child: Text(
          branch,
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
    return items;
  }

  void changedDropDownItem(String selectedBranch) {
    setState(() {
      _selectItem = selectedBranch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text("Drop Down Menu Demo"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please choose a branch:",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            DropdownButton(
                dropdownColor: Colors.red.shade900,
                value: _selectItem,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem)
          ],
        ),
      ),
    );
  }
}
