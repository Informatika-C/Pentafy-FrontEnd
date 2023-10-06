import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final Widget? suffixIcon;

  const TextInputWidget({
    super.key,
    required this.textController,
    required this.hintText,
    required this.labelText,
    this.obscureText = false,
    this.suffixIcon = null,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color:
            Colors.white, // Mengatur warna latar belakang tombol menjadi hijau
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
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: textController,
        obscureText: obscureText,
        //This will obscure text dynamically
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 10),
          // Here is key idea
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
