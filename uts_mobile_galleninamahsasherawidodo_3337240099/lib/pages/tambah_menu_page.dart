
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';

class TambahMenuPage extends StatefulWidget {
  const TambahMenuPage({super.key});

  @override
  State<TambahMenuPage> createState() => _TambahMenuPageState();
}

class _TambahMenuPageState extends State<TambahMenuPage> {
  final formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final hargaController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Tambah Menu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 99, 68, 2),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Menu',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama menu tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: hargaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Harga Menu',
                  prefixText: 'Rp ',
                  border: OutlineInputBorder(),
                ),
                              
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Harga tidak boleh kosong';
                }

                if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
                  return 'Harga harus berupa angka';
                }

                final harga = int.tryParse(value.trim());

                if (harga == null) {
                  return 'Harga terlalu besar';
                }

                if (harga <= 0) {
                  return 'Harga harus lebih dari nol';
                }

                return null;
              },
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.back(
                      result: {
                        'nama': namaController.text.trim(),
                        'harga': int.parse(
                          hargaController.text.trim(),
                        ),
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 99, 68, 2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
                child: const CustomText(
                  text: 'Simpan Menu',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
