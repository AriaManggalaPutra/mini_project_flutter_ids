import 'package:get/get.dart'; // Mengimpor paket GetX untuk pengelolaan state dan dependensi.
import 'package:miniproject/core.dart'; // Mengimpor dependensi atau modul dari core aplikasi.

class PictureBinding extends Bindings { // Mendefinisikan class binding untuk mengatur dependensi modul.
  @override
  void dependencies() { // Metode untuk mendeklarasikan semua dependensi yang diperlukan modul ini.
    Get.lazyPut(() => ListPictureController()); // Menginisialisasi ListPictureController secara lazy (hanya saat dibutuhkan).
    Get.lazyPut(() => DetailPictureController()); // Menginisialisasi DetailPictureController secara lazy.
  }
}
