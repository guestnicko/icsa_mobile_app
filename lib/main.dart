import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icsa_mobile_app/firebase_options.dart';
import 'package:icsa_mobile_app/src/myapp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Optionally automatically connect to emulator only in debug mode:
  const useEmulator = true; // flip false for production
  if (useEmulator && kDebugMode) {
    // IMPORTANT: For Android emulator use 10.0.2.2, iOS simulator or desktop use localhost.
    final host = defaultTargetPlatform == TargetPlatform.android
        ? '10.0.2.2'
        : 'localhost';
    FirebaseAuth.instance.useAuthEmulator(host, 9099);
    FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
    FirebaseFunctions.instance.useFunctionsEmulator(host, 5001);

    // For Functions, you can call functions with region/host later:
    debugPrint('Connected to Firebase emulators on $host');
  }
  runApp(const StudentOrgApp());
}
