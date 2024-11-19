// lib/main.dart
import 'package:flutter/material.dart';
import 'controllers/book_controller.dart';
import 'views/home_view.dart';

void main() {
  runApp(PerpustakaanApp());
}

class PerpustakaanApp extends StatelessWidget {
  final BookController controller = BookController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perpustakaan Online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(controller: controller),
    );
  }
}
