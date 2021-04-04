class UserResponse {
  String username;
  String email;

  UserResponse({this.username, this.email});

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        username: json["username"],
        email: json["email"],
      );
}
