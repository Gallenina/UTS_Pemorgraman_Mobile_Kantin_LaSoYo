
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';

class DetailMenuPage extends StatelessWidget {
  final String nama;
  final int harga;

  const DetailMenuPage({
    super.key,
    required this.nama,
    required this.harga,
  });

  String get deskripsi {
    switch (nama) {
      case 'Dragon Slayer Feast':
        return 'Hidangan nasi hangat dengan ayam panggang berbumbu '
            'rempah pilihan. Menu spesial untuk petualang yang lapar '
            'setelah mengalahkan naga.';
      case 'Hunter Stew':
        return 'Sup hangat berisi daging, sayuran segar, dan kuah '
            'gurih yang cocok untuk memulihkan tenaga setelah berburu.';
      case 'Whispering Forest Soup':
        return 'Sup sayuran segar dengan kuah ringan dan aroma '
            'rempah yang menenangkan, terinspirasi dari hutan ajaib.';
      case 'Adventurer Pie':
        return 'Pai gurih dengan isian daging dan sayuran, '
            'dipanggang hingga renyah dan cocok sebagai bekal petualangan.';
      case 'Alit Pastry':
        return 'Pastry mungil dengan tekstur renyah dan rasa manis '
            'yang cocok untuk camilan di sela aktivitas.';
      default:
        return 'Menu lezat dari kantin yang cocok dinikmati kapan saja.';
    }
  }

  String formatRupiah(int nilai) {
    return 'Rp ${nilai.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    const warnaUtama = Color.fromARGB(255, 99, 68, 2);

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Detail Menu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: warnaUtama,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 190,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3D6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.restaurant_menu,
                  size: 100,
                  color: warnaUtama,
                ),
              ),
            ),
            const SizedBox(height: 24),

            CustomText(
              text: nama,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: warnaUtama,
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3D6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomText(
                text: formatRupiah(harga),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: warnaUtama,
              ),
            ),
            const SizedBox(height: 24),

            const CustomText(
              text: 'Deskripsi Makanan',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),

            CustomText(
              text: deskripsi,
              fontSize: 15,
              color: Colors.black87,
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
                label: const CustomText(
                  text: 'Kembali ke Daftar Menu',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: warnaUtama,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
