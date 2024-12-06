import 'package:flutter/material.dart'; // Mengimpor widget bawaan Flutter.
import 'package:miniproject/core.dart'; // Mengimpor modul core aplikasi.

class DetailContentWidget extends StatelessWidget { 
  // Widget Stateless untuk menampilkan konten detail gambar.
  final String imageUrl; // URL gambar yang akan ditampilkan.
  final String author; // Nama penulis/author dari gambar.

  const DetailContentWidget({
    Key? key,
    required this.imageUrl, // Parameter wajib untuk URL gambar.
    required this.author, // Parameter wajib untuk nama author.
  }) : super(key: key); // Constructor dengan initializer list.

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun UI widget.
    return Column(
      children: [
        // Menampilkan gambar menggunakan widget LoadingWidget.
        LoadingWidget(
          imageUrl: imageUrl, // URL gambar.
          height: 300, // Tinggi gambar.
          width: double.infinity, // Lebar gambar penuh (sesuai layar).
        ),
        Padding(
          padding: const EdgeInsets.all(8.0), // Padding sekitar teks.
          child: Align(
            alignment: Alignment.centerRight, // Posisi teks di kanan.
            child: Text(
              "Taken by: $author", // Menampilkan nama author gambar.
              style: const TextStyle(
                fontSize: 16.0, // Ukuran font teks.
                fontWeight: FontWeight.w500, // Ketebalan font medium.
                fontStyle: FontStyle.italic, // Gaya font italic.
              ),
            ),
          ),
        ),
      ],
    );
  }
}
