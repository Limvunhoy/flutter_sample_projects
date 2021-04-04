class PhotoResponse {
  String thumbnailUrl;

  PhotoResponse({this.thumbnailUrl});

  factory PhotoResponse.fromJson(Map<String, dynamic> json) =>
      PhotoResponse(thumbnailUrl: json['thumbnailUrl']);
}
