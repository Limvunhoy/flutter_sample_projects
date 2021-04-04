import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/getx/model/article_response.dart';
import 'package:getx_sample/getx/repository/news_headline_repo/news_repo.dart';
import 'package:getx_sample/getx/repository/news_headline_repo/news_repo_imp.dart';

class SearchNewsController extends GetxController {
  NewsRepository _newsRepository;

  SearchNewsController() {
    _newsRepository = Get.find<NewsRepositoryImp>();

    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsHeadline();
      }
    });
  }

  RxBool isLoading = false.obs;

  RxList<ArticleResponse> articles = RxList();

  final searchTextController = TextEditingController();

  searchNewsHeadline() async {
    showLoading();
    Future.delayed(Duration(seconds: 10), () async {
      final result =
          await _newsRepository.getSearchNews(searchTextController.text);
      hideLoading();

      if (result != null) {
        articles = result.obs;
      }
    });
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
