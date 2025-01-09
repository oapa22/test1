class UsersDataModel {
  String? username;
  String? email;
  String? urlAvatar;
  // ? = puede que venga en nulo

  UsersDataModel({this.username, this.email, this.urlAvatar});

  UsersDataModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    urlAvatar = json['urlAvatar'];
  }
}
