import 'package:flutter/material.dart';

class BirthdayInput extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  BirthdayInput({required this.onDateSelected});

  @override
  _BirthdayInputState createState() => _BirthdayInputState();
}

class _BirthdayInputState extends State<BirthdayInput> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onDateSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateText = selectedDate != null
        ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
        : "Pilih Tanggal";

    return Container(
      width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255,
                        255), // Mengatur warna latar belakang tombol menjadi hijau
                    borderRadius: BorderRadius.circular(
                        8), // Mengatur radius border tombol
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(
                            255, 0, 0, 0), // Warna dan opasitas bayangan
                        spreadRadius: 2, // Radius penyebaran bayangan
                        blurRadius: 1, // Radius blur bayangan
                        offset: Offset(-2, 4), // Posisi bayangan (x, y)
                      ),
                    ],
                  ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              readOnly: true,
              controller: TextEditingController(text: dateText),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),
          IconButton(
            onPressed: () => _selectDate(context),
            icon: Icon(Icons.calendar_today),
          ),
        ],
      ),
    );
  }
}