import 'package:flutter/material.dart'; // Mengimpor widget bawaan Flutter.
import 'package:miniproject/core.dart'; // Mengimpor modul core aplikasi.

class ListContentWidget extends StatelessWidget { 
  // Widget Stateless untuk menampilkan item gambar di dalam daftar.
  final dynamic picture; // Data gambar berupa map (key-value).
  final VoidCallback onTap; // Fungsi callback saat item ditekan.

  const ListContentWidget({
    Key? key,
    required this.picture, // Parameter wajib untuk data gambar.
    required this.onTap, // Parameter wajib untuk fungsi onTap.
  }) : super(key: key); // Constructor dengan initializer list.

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun UI widget.
    return GestureDetector(
      onTap: onTap, // Fungsi yang dipanggil saat item ditekan.
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), 
        // Margin untuk memberikan jarak antar item.
        child: Column(
          children: [
            // Menampilkan gambar menggunakan widget LoadingWidget.
            LoadingWidget(
              imageUrl: picture['download_url'], // URL gambar.
              height: 200, // Tinggi gambar.
              width: double.infinity, // Lebar gambar penuh (sesuai layar).
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // Padding sekitar teks.
              child: Align(
                alignment: Alignment.centerRight, // Posisi teks di kanan.
                child: Text(
                  "by: ${picture['author']}", // Menampilkan nama author.
                  style: const TextStyle(
                    fontSize: 14.0, // Ukuran font teks.
                    fontStyle: FontStyle.italic, // Gaya font italic.
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
