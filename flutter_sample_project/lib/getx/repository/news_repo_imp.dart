import 'package:dio/dio.dart';
import 'package:flutter_sample_project/getx/model/article_response.dart';
import 'package:flutter_sample_project/getx/model/news_response.dart';
import 'package:flutter_sample_project/getx/repository/news_repo.dart';
import 'package:flutter_sample_project/getx/service/http_service.dart';
import 'package:flutter_sample_project/getx/service/http_service_imp.dart';
import 'package:get/get.dart';

class NewsRepositoryImp implements NewsRepository {
  HttpService _httpService;

  NewsRepositoryImp() {
    _httpService = Get.put(HttpServiceImp());
    _httpService.init();
  }

  @override
  Future<List<ArticleResponse>> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest("/v2/top-headlines?country=us");
      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles;
    } on DioError catch (e) {
      print("Get Headlines Failed: ${e.message}");
      return null;
    }
  }

  @override
  Future<List<ArticleResponse>> getSearchNews(String query) async {
    try {
      final response = await _httpService.getRequest("/v2/everything?q=$query");
      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles;
    } on DioError catch (e) {
      print("Get Headlines Failed: ${e.message}");
      return null;
    }
  }
}
