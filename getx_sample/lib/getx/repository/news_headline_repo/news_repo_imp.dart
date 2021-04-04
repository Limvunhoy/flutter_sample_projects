import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_sample/getx/service/base_api_service.dart';

import '../../model/article_response.dart';
import '../../model/news_response.dart';
import '../../service/http_service.dart';
import '../../service/http_service_imp.dart';
import 'news_repo.dart';

class NewsRepositoryImp implements NewsRepository {
  HttpService _httpService;

  BaseApiHelper _helper = BaseApiHelper();

  NewsRepositoryImp() {
    _httpService = Get.put(HttpServiceImp());
    _httpService.init();
  }

  @override
  Future<List<ArticleResponse>> getNewsHeadline() async {
    final response = await _helper.get("/v2/top-headlines?country=us");
    return NewsResponse.fromJson(response).articles;

    // OR

    // try {
    //   final response =
    //       await _httpService.getRequest("/v2/top-headlines?country=us");
    //   final parsedResponse = NewsResponse.fromJson(response.data);
    //
    //   return parsedResponse.articles;
    // } on DioError catch (e) {
    //   print("Get Headlines Failed: ${e.message}");
    //   return null;
    // }
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
