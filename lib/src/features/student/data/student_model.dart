class Student {
  final String id;
  final String name;
  final String course;
  final int yearLevel;

  Student({
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

  factory Student.fromMap(Map<String, dynamic> data) {
    return Student(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      course: data['course'] ?? '',
      yearLevel: data['yearLevel'] ?? 0,
    );
  }
}
