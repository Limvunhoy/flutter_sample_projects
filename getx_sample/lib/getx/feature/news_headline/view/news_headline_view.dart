import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/getx/core/widget/drawer.dart';
import 'package:getx_sample/getx/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatefulWidget {
  @override
  _NewsHeadlineViewState createState() => _NewsHeadlineViewState();
}

class _NewsHeadlineViewState extends State<NewsHeadlineView> {
  final controller = Get.find<NewsHeadlineController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Demo"),
        backgroundColor: Colors.red,
      ),
      drawer: appDrawer(),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: ListView.separated(
                    itemCount: controller.articles.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.articles[index].urlToImage == null
                              ? Container()
                              : Image.network(
                                  controller.articles[index].urlToImage),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            controller.articles[index].title,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
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
                    }),
              );
      }),
    );
  }
}
