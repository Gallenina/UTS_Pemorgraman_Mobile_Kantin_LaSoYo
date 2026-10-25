
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Font Press Start 2P dipilih agar teks terlihat khas dan unik. (Tema Pixel Art)
// Ukuran dan ketebalan teks dapat diatur sesuai kebutuhan.
// Warna teks dibuat fleksibel agar cocok untuk berbagai halaman aplikasi.
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.pressStart2p(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
