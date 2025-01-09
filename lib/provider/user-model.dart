class User {
  final String username;
  final String email;
  final String name;

  User({
    required this.username,
    required this.email,
    required this.name,
  });

  /*static User fromJson(json) => User(
        username: json['username'],
        email: json['email'],
        urlAvatar: json['urlAvatar'],
      );*/
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      name: json['name'],
    );
  }
}
