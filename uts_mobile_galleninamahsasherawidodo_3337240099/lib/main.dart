
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/custom_text.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HalamanAwal(),
    );
  }
}

class HalamanAwal extends StatelessWidget {
  const HalamanAwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Aplikasi Kantin LaSoYo',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 99, 68, 2),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: 'Selamat Datang di Kantin LaSoYo!',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 99, 68, 2),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const MenuPage());
              },
              child: const CustomText(
                text: 'Lihat Daftar Menu LaSoYo',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 99, 68, 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
