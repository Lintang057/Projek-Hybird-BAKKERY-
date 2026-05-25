import 'package:flutter/material.dart';
import 'pages/cover_page.dart';

void main() {
  runApp(const BakeryApp());
}

class BakeryApp extends StatelessWidget {
  const BakeryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bakery's Link",
      home: const CoverPage(),
    );
  }
}