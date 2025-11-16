// lib/config/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icsa_mobile_app/src/common/widgets/navigation_bar.dart';
import 'package:icsa_mobile_app/src/features/admin/presentation/pages/admin_dashboard.dart';
import 'package:icsa_mobile_app/src/features/authentication/presentation/pages/login_page.dart';
import 'package:icsa_mobile_app/src/features/home/presentation/pages/home_page.dart';
import 'package:icsa_mobile_app/src/features/student/presentation/pages/add_student_dialog.dart';
import 'package:icsa_mobile_app/src/features/student/presentation/pages/student_page.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
        );
      },
      routes: [
        GoRoute(
            path: "/login", builder: (context, state) => const LoginScreen()),
        GoRoute(path: "/", builder: (context, state) => const HomeScreen()),
        GoRoute(
            path: '/announcements',
            builder: (context, state) => const AdminDashboardPage()),
        GoRoute(
          path: '/admin',
          builder: (context, state) => const AdminDashboardPage(),
          routes: [
            GoRoute(
              path: 'students',
              builder: (context, state) => const StudentPage(),
              routes: [
                GoRoute(
                    path: ("add-student"),
                    builder: (context, state) => const AddStudentDialog())
              ],
            ),
          ],
        ),
      ],
    )
  ],
  redirect: (context, state) {
    // Optional: Add authentication redirect logic here
    return null;
  },
);
