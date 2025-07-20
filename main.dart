import 'package:communidrive/src/loginsignup.dart';
import 'package:flutter/material.dart';

// Ensure this import statement is pointing to the correct file.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneNo(),
    );
  }
}
