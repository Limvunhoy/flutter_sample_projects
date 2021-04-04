import 'package:flutter/material.dart';

enum SheetType {
  more,
  favorite,
  profile,
  logout,
}

ListTile getListTile(icon, iconColor, titleText, context, SheetType type) {
  return ListTile(
    leading: Container(
      width: 40.0,
      child: Icon(
        icon,
        color: iconColor,
        size: 24.0,
      ),
    ),
    title: Text(
      titleText,
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
    ),
    onTap: () {
      switch (type) {
        case SheetType.more:
          print("More");
          break;
        case SheetType.favorite:
          print("Favorite");
          break;
        case SheetType.profile:
          print("Profile");
          break;
        case SheetType.logout:
          print("Logout");
          break;
      }
      Navigator.of(context).pop();
    },
  );
}
