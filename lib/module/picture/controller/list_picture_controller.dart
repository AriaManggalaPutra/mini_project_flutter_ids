import 'package:get/get.dart'; // Mengimpor paket GetX.
import 'package:miniproject/core.dart'; // Mengimpor core aplikasi.

class ListPictureController extends GetxController { // Controller untuk mengelola daftar gambar.
  var pictures = [].obs; // Observable untuk menyimpan daftar gambar dalam bentuk list.
  var isLoading = true.obs; // Observable untuk status loading (true jika sedang memuat data).
  int limit = 10; // Batas jumlah data yang diambil per halaman.
  int page = 1; // Halaman saat ini, default ke halaman pertama.

  @override
  void onInit() { // Fungsi yang dijalankan saat controller diinisialisasi.
    fetchPictures(); // Memanggil fungsi fetchPictures untuk memuat data pertama kali.
    super.onInit(); // Memanggil implementasi `onInit` dari parent class.
  }

  void fetchPictures() async { // Fungsi untuk mengambil daftar gambar.
    isLoading.value = true; // Set isLoading ke true sebelum data mulai diambil.
    try {
      pictures.value = await PictureService().fetchPictures(limit: limit, page: page); 
      // Mengambil daftar gambar dari PictureService berdasarkan limit dan page.
    } finally {
      isLoading.value = false; // Set isLoading ke false setelah data selesai diambil, terlepas sukses/gagal.
    }
  }
}
