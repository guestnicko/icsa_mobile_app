import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icsa_mobile_app/src/common/widgets/navigation_bar.dart';
import 'package:icsa_mobile_app/src/core/theme/app_color.dart';
import 'package:icsa_mobile_app/src/features/student/data/student_provider.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final students = context.watch<StudentProvider>().students;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Manage Students'),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Student',
            onPressed: () => context.go("/admin/students/add-student"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: students.isEmpty
            ? const Center(child: Text('No students found'))
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Course')),
                    DataColumn(label: Text('Year Level')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: students
                      .map(
                        (s) => DataRow(cells: [
                          DataCell(Text(s.name)),
                          DataCell(Text(s.course)),
                          DataCell(Text('${s.yearLevel}')),
                          DataCell(
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => context
                                  .read<StudentProvider>()
                                  .removeStudent(s.id),
                            ),
                          ),
                        ]),
                      )
                      .toList(),
                ),
              ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
