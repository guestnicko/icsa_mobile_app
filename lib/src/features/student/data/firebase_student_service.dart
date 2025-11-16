import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icsa_mobile_app/src/features/student/data/student_model.dart';

class FirebaseStudentService {
  final _db = FirebaseFirestore.instance;

  Stream<List<Student>> getStudentsStream() {
    return _db.collection('students').snapshots().map(
          (snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            return Student.fromMap({...data, 'id': doc.id});
          }).toList(),
        );
  }

  Future<void> addStudent(Student student) async {
    await _db.collection('students').add(student.toMap());
  }

  Future<void> deleteStudent(String id) async {
    await _db.collection('students').doc(id).delete();
  }
}
