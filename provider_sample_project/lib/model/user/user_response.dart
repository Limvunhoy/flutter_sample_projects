class UserResponse {
  String name;
  String email;

  UserResponse({this.name, this.email});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      UserResponse(name: json["name"], email: json["email"]);
}
