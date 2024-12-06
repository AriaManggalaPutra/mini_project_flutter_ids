import 'package:flutter/material.dart'; // Mengimpor widget bawaan Flutter.
import 'package:get/get.dart'; // Mengimpor paket GetX untuk manajemen state dan navigasi.
import 'package:miniproject/core.dart'; // Mengimpor modul core aplikasi, termasuk controller.

class DetailPictureView extends StatelessWidget { // Stateless widget untuk menampilkan detail gambar.
  final controller = Get.find<DetailPictureController>(); 
  // Mengambil instance DetailPictureController yang sudah didaftarkan sebelumnya.

  @override
  Widget build(BuildContext context) { // Fungsi build untuk membangun UI.
    final id = Get.arguments; 
    // Mengambil ID gambar dari argument yang diteruskan saat navigasi.
    controller.fetchPictureDetail(id); 
    // Memanggil fungsi fetchPictureDetail di controller untuk memuat data detail gambar.

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Photo")), 
      // AppBar dengan judul "Detail Photo".
      body: Obx(() { 
        // Widget reaktif yang akan rebuild jika ada perubahan state pada observables di controller.
        if (controller.isLoading.value) { 
          // Jika sedang loading, tampilkan indikator loading.
          return const Center(child: CircularProgressIndicator());
        }
        var detail = controller.pictureDetail; 
        // Data detail gambar dari controller.
        return DetailContentWidget(
          imageUrl: detail['download_url'], // URL gambar untuk ditampilkan.
          author: detail['author'], // Nama penulis gambar untuk ditampilkan.
        );
      }),
    );
  }
}
