// lib/widgets/book_list.dart
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookList extends StatelessWidget {
  final List<Book> books;
  final Function(Book) onEdit;
  final Function(Book) onDelete;

  BookList({required this.books, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return Center(child: Text('Tidak ada buku.'));
    }
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        Book book = books[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: book.fotoBuku.isNotEmpty
                ? Image.asset(
                    book.fotoBuku,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 50,
                        color: Colors.grey,
                        child: Icon(Icons.broken_image, color: Colors.white),
                      );
                    },
                  )
                : Container(
                    width: 50,
                    color: Colors.grey,
                    child: Icon(Icons.book, color: Colors.white),
                  ),
            title: Text(book.judul),
            subtitle: Text('Stok: ${book.stok}\nPengarang: ${book.pengarang}'),
            isThreeLine: true,
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  onEdit(book);
                } else if (value == 'delete') {
                  onDelete(book);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
