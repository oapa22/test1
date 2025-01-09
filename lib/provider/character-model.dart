class Character {
  final String name;
  final String gender;
  final String image;
  final String status;

  Character({
    required this.name,
    required this.gender,
    required this.image,
    required this.status,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
