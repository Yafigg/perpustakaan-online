// lib/controllers/book_controller.dart
import '../models/book.dart';

class BookController {
  // Menjadikan _books sebagai final
  final List<Book> _books = [];

  // Getter untuk mendapatkan semua buku
  List<Book> get books => _books;

  // Menambahkan buku
  void addBook(Book book) {
    _books.add(book);
  }

  // Mengupdate buku berdasarkan id
  void updateBook(int id, Book updatedBook) {
    int index = _books.indexWhere((book) => book.id == id);
    if (index != -1) {
      _books[index] = updatedBook;
    }
  }

  // Menghapus buku berdasarkan id
  void deleteBook(int id) {
    _books.removeWhere((book) => book.id == id);
  }

  // Mendapatkan buku berdasarkan id dengan penanganan null
  Book? getBookById(int id) {
    try {
      return _books.firstWhere((book) => book.id == id);
    } catch (e) {
      return null;
    }
  }
}
