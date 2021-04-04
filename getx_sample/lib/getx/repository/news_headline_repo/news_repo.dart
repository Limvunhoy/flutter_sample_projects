import '../../model/article_response.dart';

abstract class NewsRepository {
  Future<List<ArticleResponse>> getNewsHeadline();
  Future<List<ArticleResponse>> getSearchNews(String query);
}
