import 'package:flutter/material.dart';
import 'package:icsa_mobile_app/src/features/student/data/firebase_student_service.dart';
import 'package:icsa_mobile_app/src/features/student/data/student_model.dart';

class StudentProvider extends ChangeNotifier {
  final FirebaseStudentService _service = FirebaseStudentService();
  List<Student> _students = [];

  List<Student> get students => _students;

  StudentProvider() {
    _listenToStudents();
  }

  void _listenToStudents() {
    _service.getStudentsStream().listen((data) {
      _students = data;
      notifyListeners();
    });
  }

  Future<void> addStudent(Student student) async {
    await _service.addStudent(student);
  }

  Future<void> removeStudent(String id) async {
    await _service.deleteStudent(id);
  }
}
