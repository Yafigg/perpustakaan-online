// lib/views/add_book_view.dart
import 'package:flutter/material.dart';
import '../controllers/book_controller.dart';
import '../models/book.dart';
import '../widgets/book_form.dart';

class AddBookView extends StatelessWidget {
  final BookController controller;

  AddBookView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Buku'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: BookForm(
          onSubmit: (Book book) {
            controller.addBook(book);
          },
        ),
      ),
    );
  }
}
