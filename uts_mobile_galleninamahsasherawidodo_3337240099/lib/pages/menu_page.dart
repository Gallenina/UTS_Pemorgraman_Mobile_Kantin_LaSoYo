
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';
import 'tambah_menu_page.dart';
import 'detail_menu_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Map<String, dynamic>> daftarMenu = [
    {'nama': 'Dragon Slayer Feast', 'harga': 15000},
    {'nama': 'Hunter Stew', 'harga': 12000},
    {'nama': 'Whispering Forest Soup', 'harga': 13000},
    {'nama': 'Adventurer Pie', 'harga': 14000},
    {'nama': 'Alit Pastry', 'harga': 5000},
  ];

  String formatRupiah(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    )}';
  }

  Future<void> bukaTambahMenu() async {
    final hasil = await Get.to<Map<String, dynamic>>(
      () => const TambahMenuPage(),
    );

    if (hasil != null) {
      setState(() {
        daftarMenu.add(hasil);
      });
    }
  }

  void bukaDetail(Map<String, dynamic> menu) {
    Get.to(
      () => DetailMenuPage(
        nama: menu['nama'].toString(),
        harga: menu['harga'] as int,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const warnaUtama = Color.fromARGB(255, 99, 68, 2);

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Daftar Menu Kantin',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: warnaUtama,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: CustomText(
              text: 'Pilih Menu Favoritmu',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: warnaUtama,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarMenu.length,
              itemBuilder: (context, index) {
                final menu = daftarMenu[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.restaurant,
                      color: Colors.teal,
                    ),
                    title: CustomText(
                      text: menu['nama'].toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: CustomText(
                      text: formatRupiah(menu['harga'] as int),
                      fontSize: 14,
                      color: Colors.green,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    onTap: () => bukaDetail(menu),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bukaTambahMenu,
        backgroundColor: warnaUtama,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
