import 'package:flutter/material.dart';
import 'package:icsa_mobile_app/src/core/routes/router.dart';
import 'package:icsa_mobile_app/src/core/theme/app_theme.dart';
import 'package:icsa_mobile_app/src/core/theme/theme_provider.dart';

import 'package:provider/provider.dart';
import 'package:icsa_mobile_app/src/features/authentication/provider/auth_provider.dart';
import 'package:icsa_mobile_app/src/features/student/data/student_provider.dart';

class StudentOrgApp extends StatelessWidget {
  const StudentOrgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => StudentProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Student Organization Admin',
        routerConfig: router,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeProvider().themeMode,
      ),
    );
  }
}
