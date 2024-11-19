// lib/models/book.dart
class Book {
  int id;
  String judul;
  String deskripsi;
  int stok;
  String fotoBuku; // Path ke aset lokal
  String penerbit;
  String pengarang;

  Book({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.stok,
    required this.fotoBuku,
    required this.penerbit,
    required this.pengarang,
  });
}
