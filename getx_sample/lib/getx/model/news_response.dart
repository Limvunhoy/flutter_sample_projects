import 'article_response.dart';

class NewsResponse {
  String status;
  int totalResults;
  List<ArticleResponse> articles;

  NewsResponse({this.status, this.totalResults, this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: List<ArticleResponse>.from(json["articles"].map((article) => ArticleResponse.fromJson(article))));
}
