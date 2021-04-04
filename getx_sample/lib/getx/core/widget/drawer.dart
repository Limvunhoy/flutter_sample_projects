import 'package:flutter/material.dart';
import 'package:get/get.dart';

appDrawer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text("News Headline"),
          leading: Icon(Icons.contact_page_outlined),
          onTap: () {},
        ),
        ListTile(
          title: Text("Search News"),
          leading: Icon(Icons.search),
          onTap: () {
            Get.toNamed('/search_news');
          },
        ),
      ],
    ),
  );
}
