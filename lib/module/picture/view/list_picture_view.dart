import 'package:flutter/material.dart'; // Mengimpor widget bawaan Flutter.
import 'package:get/get.dart'; // Mengimpor paket GetX untuk manajemen state dan navigasi.
import 'package:miniproject/core.dart'; // Mengimpor modul core aplikasi, termasuk controller.

class ListPictureView extends StatelessWidget { // Stateless widget untuk menampilkan daftar gambar.
  final controller = Get.find<ListPictureController>(); 
  // Mengambil instance ListPictureController yang sudah didaftarkan sebelumnya.

  @override
  Widget build(BuildContext context) { // Fungsi build untuk membangun UI.
    return Scaffold(
      appBar: AppBar(title: const Text("List Photo")), 
      // AppBar dengan judul "List Photo".
      body: Obx(() { 
        // Widget reaktif yang akan rebuild jika ada perubahan state pada observables di controller.
        if (controller.isLoading.value) { 
          // Jika sedang loading, tampilkan indikator loading.
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder( 
          // Menampilkan daftar gambar menggunakan ListView.
          itemCount: controller.pictures.length, 
          // Jumlah item yang akan ditampilkan sesuai panjang daftar gambar.
          itemBuilder: (context, index) { 
            // Fungsi untuk membangun tiap item dalam daftar.
            var picture = controller.pictures[index]; 
            // Mengambil data gambar pada indeks tertentu.
            return ListContentWidget(
              picture: picture, // Data gambar yang akan diteruskan ke widget item.
              onTap: () => Get.toNamed(Routes.DETAIL, arguments: picture['id']), 
              // Navigasi ke halaman detail gambar dengan meneruskan ID gambar sebagai argument.
            );
          },
        );
      }),
    );
  }
}
