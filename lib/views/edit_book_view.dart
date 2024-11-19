// lib/views/edit_book_view.dart
import 'package:flutter/material.dart';
import '../controllers/book_controller.dart';
import '../models/book.dart';
import '../widgets/book_form.dart';

class EditBookView extends StatelessWidget {
  final BookController controller;
  final Book book;

  EditBookView({required this.controller, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Buku'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: BookForm(
          book: book,
          onSubmit: (Book updatedBook) {
            controller.updateBook(book.id, updatedBook);
          },
        ),
      ),
    );
  }
}
