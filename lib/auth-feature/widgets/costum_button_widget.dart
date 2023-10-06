import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CostumButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme
            .tertiary, // Mengatur warna latar belakang tombol menjadi hijau
        borderRadius: BorderRadius.circular(8), // Mengatur radius border tombol
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0), // Warna dan opasitas bayangan
            spreadRadius: 2, // Radius penyebaran bayangan
            blurRadius: 1, // Radius blur bayangan
            offset: Offset(-2, 4), // Posisi bayangan (x, y)
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: this.onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Color.fromARGB(
              0, 0, 0, 0), // Hapus warna latar belakang bawaan tombol
          elevation: 0, // Setel nilai elevasi bawaan tombol menjadi 0
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
