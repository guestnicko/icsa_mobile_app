class User {
  final String id;
  final String name;
  final String course;
  final int yearLevel;

  User({
    required this.id,
    required this.name,
    required this.course,
    required this.yearLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'course': course,
      'yearLevel': yearLevel,
    };
  }

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      course: data['course'] ?? '',
      yearLevel: data['yearLevel'] ?? 0,
    );
  }
}
