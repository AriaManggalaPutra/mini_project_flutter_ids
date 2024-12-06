import 'package:get/get.dart'; // Mengimpor paket GetX.
import 'package:miniproject/core.dart'; // Mengimpor core aplikasi yang mungkin berisi service, model, dll.

class DetailPictureController extends GetxController { // Controller untuk mengelola data detail gambar.
  var pictureDetail = {}.obs; // Observable untuk menyimpan data detail gambar dalam bentuk map.
  var isLoading = true.obs; // Observable untuk status loading (true jika sedang memuat data).

  void fetchPictureDetail(String id) async { // Fungsi untuk mengambil detail gambar berdasarkan ID.
    isLoading.value = true; // Set isLoading ke true sebelum data mulai diambil.
    try {
      pictureDetail.value = await PictureService().fetchPictureDetail(id); 
      // Mengambil detail gambar dari PictureService dan menyimpannya di pictureDetail.
    } finally {
      isLoading.value = false; // Set isLoading ke false setelah data selesai diambil, terlepas sukses/gagal.
    }
  }
}
