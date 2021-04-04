class ArticleResponse {
  String author;
  String subtitle;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  ArticleResponse(
      {this.author,
      this.subtitle,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      ArticleResponse(
        author: json["author"],
        subtitle: json["subtitle"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
      );

  DateTime get getPublishedAtDate => DateTime.tryParse(publishedAt);
}
