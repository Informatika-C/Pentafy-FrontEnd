import 'package:flutter/material.dart';

void showDetailStatusUser(BuildContext context, String message) {
  final overlay = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 10,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 224, 224).withOpacity(0.7),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 13,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlay);

  // Hapus toast setelah beberapa detik
  Future.delayed(Duration(seconds: 2), () => overlay.remove());
}
void showDetailMarkUser(BuildContext context, String message) {
  final overlay = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 10,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 224, 224).withOpacity(0.7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlay);

  // Hapus toast setelah beberapa detik
  Future.delayed(Duration(seconds: 2), () => overlay.remove());
}
