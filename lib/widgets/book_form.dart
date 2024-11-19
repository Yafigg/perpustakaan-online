// lib/widgets/book_form.dart
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookForm extends StatefulWidget {
  final Book? book;
  final Function(Book) onSubmit;

  BookForm({this.book, required this.onSubmit});

  @override
  _BookFormState createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();

  late int id;
  late String judul;
  late String deskripsi;
  late int stok;
  late String fotoBuku;
  late String penerbit;
  late String pengarang;

  // Daftar gambar yang tersedia di assets
  final List<String> availableImages = [
    'assets/images/book1.jpg',
    'assets/images/book2.png',
    // Tambahkan path gambar lainnya di sini
  ];

  @override
  void initState() {
    super.initState();
    if (widget.book != null) {
      id = widget.book!.id;
      judul = widget.book!.judul;
      deskripsi = widget.book!.deskripsi;
      stok = widget.book!.stok;
      fotoBuku = widget.book!.fotoBuku;
      penerbit = widget.book!.penerbit;
      pengarang = widget.book!.pengarang;
    } else {
      id = DateTime.now().millisecondsSinceEpoch;
      judul = '';
      deskripsi = '';
      stok = 0;
      fotoBuku = availableImages.isNotEmpty ? availableImages[0] : '';
      penerbit = '';
      pengarang = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: judul,
            decoration: InputDecoration(labelText: 'Judul'),
            validator: (value) => value!.isEmpty ? 'Tidak boleh kosong' : null,
            onSaved: (value) => judul = value!,
          ),
          TextFormField(
            initialValue: deskripsi,
            decoration: InputDecoration(labelText: 'Deskripsi'),
            validator: (value) => value!.isEmpty ? 'Tidak boleh kosong' : null,
            onSaved: (value) => deskripsi = value!,
          ),
          TextFormField(
            initialValue: stok.toString(),
            decoration: InputDecoration(labelText: 'Stok'),
            keyboardType: TextInputType.number,
            validator: (value) => value!.isEmpty ? 'Tidak boleh kosong' : null,
            onSaved: (value) => stok = int.parse(value!),
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: fotoBuku.isNotEmpty ? fotoBuku : null,
            decoration: InputDecoration(labelText: 'Foto Buku'),
            items: availableImages.map((String imagePath) {
              return DropdownMenuItem<String>(
                value: imagePath,
                child: Row(
                  children: [
                    Image.asset(
                      imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Text(imagePath.split('/').last),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                fotoBuku = value ?? '';
              });
            },
            validator: (value) => value == null || value.isEmpty ? 'Pilih gambar buku' : null,
            onSaved: (value) => fotoBuku = value ?? '',
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: penerbit,
            decoration: InputDecoration(labelText: 'Penerbit'),
            onSaved: (value) => penerbit = value ?? '',
          ),
          TextFormField(
            initialValue: pengarang,
            decoration: InputDecoration(labelText: 'Pengarang'),
            onSaved: (value) => pengarang = value ?? '',
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text(widget.book == null ? 'Tambah Buku' : 'Update Buku'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Book newBook = Book(
                  id: id,
                  judul: judul,
                  deskripsi: deskripsi,
                  stok: stok,
                  fotoBuku: fotoBuku,
                  penerbit: penerbit,
                  pengarang: pengarang,
                );
                widget.onSubmit(newBook);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
