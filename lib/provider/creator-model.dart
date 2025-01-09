class Creator {
  final String id;
  final String thumbnail;
  final String firstName;
  final String lastName;
  final String fullName;

  Creator({
    required this.id,
    required this.thumbnail,
    required this.firstName,
    required this.lastName,
    required this.fullName,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      id: json['id'].toString(),
      thumbnail: json['thumbnail '] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      fullName: json['fullName'] ?? '',
    );
  }
}
