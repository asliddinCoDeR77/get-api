import 'package:dars_5ux/views/screens/primary_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PrimaryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
