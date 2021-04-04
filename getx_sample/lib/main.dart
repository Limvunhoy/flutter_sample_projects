import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_sample/getx/feature/news_headline/binding/news_headline_binding.dart';

import 'getx/feature/search/binding/search_news_binding.dart';
import 'getx/feature/news_headline/view/news_headline_view.dart';
import 'getx/feature/search/view/search_news_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX Sample Project",
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
            name: "/news_headline",
            page: () => NewsHeadlineView(),
            binding: NewsHeadlineBinding()),
        GetPage(
            name: "/search_news",
            page: () => SearchNewsView(),
            binding: SearchNewsBinding()),
      ],
      initialRoute: "/news_headline",
    );
  }
}
