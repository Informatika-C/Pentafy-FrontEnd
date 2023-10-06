import 'package:flutter/material.dart';

class GenderInput extends StatefulWidget {
  final String? selectedGender;
  final Function(String) onChanged;

  GenderInput({required this.selectedGender, required this.onChanged});

  @override
  _GenderInputState createState() => _GenderInputState();
}

class _GenderInputState extends State<GenderInput> {
  @override
  Widget build(BuildContext context) {
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
          SizedBox(width: 10),
          Text(
            'Jenis Kelamin :',
            style: TextStyle(fontSize: 16, ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: widget.selectedGender,
              onChanged: (newValue) {
                widget.onChanged(newValue!);
              },
              items: <String>[
                'Laki-laki',
                'Perempuan',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                border: InputBorder.none,
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}