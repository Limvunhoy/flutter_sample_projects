import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_sample/getx/core/widget/drawer.dart';
import 'package:getx_sample/getx/feature/search/controller/search_news_controller.dart';

class SearchNewsView extends StatefulWidget {
  @override
  _SearchNewsViewState createState() => _SearchNewsViewState();
}

class _SearchNewsViewState extends State<SearchNewsView> {
  final controller = Get.find<SearchNewsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Demo"),
        backgroundColor: Colors.red,
      ),
      drawer: appDrawer(),
      body: Column(
        children: [
          TextField(
            controller: controller.searchTextController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: Obx(() {
              return controller.isLoading.isTrue
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.articles.isEmpty
                      ? Center(
                          child: Text("No news found!"),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                controller.articles[index].urlToImage == null
                                    ? Container()
                                    : Image.network(
                                        controller.articles[index].urlToImage),
                                SizedBox(height: 8.0),
                                Text(
                                  controller.articles[index].title,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  controller.articles[index].description,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: controller.articles.length);
            }),
          )
        ],
      ),
    );
  }
}
