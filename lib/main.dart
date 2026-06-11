import 'package:flutter/material.dart';
import 'package:swift_mart/features/registration/verification/verification_screen.dart';
import 'package:swift_mart/features/registration/verification/verify_phone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerifyPhone(),
    );
  }
}

