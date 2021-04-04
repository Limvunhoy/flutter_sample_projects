import 'package:flutter/material.dart';

enum Screens { BottomSheetView, DropDownButton, FetchDataSample }

ListTile listTile(titleText, context, icon, iconColor, onTap) {
  return ListTile(
    tileColor: Colors.grey[900],
    title: Text(
      titleText,
      style: TextStyle(color: Colors.grey),
    ),
    trailing: Container(
        child: Icon(
      icon,
      color: iconColor,
      size: 24.0,
    )),
    onTap: onTap,
  );
}
