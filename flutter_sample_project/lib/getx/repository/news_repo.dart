import 'package:flutter_sample_project/getx/model/article_response.dart';

abstract class NewsRepository {
  Future<List<ArticleResponse>> getNewsHeadline();
  Future<List<ArticleResponse>> getSearchNews(String query);
}
