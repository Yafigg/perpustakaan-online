// lib/views/home_view.dart
import 'package:flutter/material.dart';
import '../controllers/book_controller.dart';
import '../models/book.dart';
import '../widgets/book_list.dart';
import 'add_book_view.dart';
import 'edit_book_view.dart';

class HomeView extends StatefulWidget {
  final BookController controller;

  HomeView({required this.controller});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void _navigateToAddBook() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddBookView(controller: widget.controller),
      ),
    ).then((_) {
      setState(() {}); // Refresh setelah kembali
    });
  }

  void _navigateToEditBook(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditBookView(controller: widget.controller, book: book),
      ),
    ).then((_) {
      setState(() {}); // Refresh setelah kembali
    });
  }

  void _deleteBook(Book book) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hapus Buku'),
        content: Text('Apakah Anda yakin ingin menghapus "${book.judul}"?'),
        actions: [
          TextButton(
            child: Text('Batal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Hapus'),
            onPressed: () {
              widget.controller.deleteBook(book.id);
              Navigator.of(context).pop();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Book> books = widget.controller.books;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perpustakaan Online'),
      ),
      body: BookList(
        books: books,
        onEdit: _navigateToEditBook,
        onDelete: _deleteBook,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _navigateToAddBook,
      ),
    );
  }
}
