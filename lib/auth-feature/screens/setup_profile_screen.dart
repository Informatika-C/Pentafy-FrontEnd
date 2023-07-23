import 'package:flutter/material.dart';

import '../widgets/Jenis_kelamin_widget.dart';
import '../widgets/tanggal_widget.dart';

class SetUpProfileScreen extends StatefulWidget {
  @override
  _SetUpProfileScreenState createState() => _SetUpProfileScreenState();
}

class _SetUpProfileScreenState extends State<SetUpProfileScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool passwordVisible = false;

  void _login() {
    // Anda dapat mengimplementasikan logika login di sini
    String email = _emailController.text;
    String password = _passwordController.text;

    // Untuk sementara, kita hanya mencetak email, password, dan nilai rememberMe
    print('Email: $email');
    print('Password: $password');
    print('Ingat Saya: $_rememberMe');
  }

  void _onRememberMeChanged(bool? value) {
    setState(() {
      _rememberMe = value!;
    });
  }

  void _klikdisini() {
    // Implementasi logika untuk tombol "Lupa Password?" di sini
    // Misalnya, tampilkan dialog atau navigasikan ke halaman reset password
    print('Tombol "Lupa Password?" diklik');
  }

  void _daftar() {}

  @override
  Widget build(BuildContext context) {
    var selectedGender;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 97, 170),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: 170,
                        child: Image.network(
                          'data:image/jpeg;base64,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',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 5,
                      child: Container(
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          iconSize: 15,
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Ubah Foto Profil '),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Pilih foto profil'),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Aksi yang dijalankan ketika tombol di tekan
                                          // Tambahkan kode untuk memilih file gambar
                                        },
                                        child: Text('Pilih Gambar'),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Aksi yang dijalankan ketika tombol "Cancel" di tekan
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Aksi yang dijalankan ketika tombol "Upload" di tekan
                                        // Tambahkan kode untuk mengunggah file gambar
                                      },
                                      child: Text('Upload'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16),
                Container(
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
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _emailController,
                    //This will obscure text dynamically
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Username/Email',
                      hintText: 'Masukkan Username/Email ',
                      contentPadding: EdgeInsets.only(left: 10),
                      // Here is key idea
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GenderInput(
                  selectedGender: selectedGender,
                  onChanged: (newValue) {
                    setState(() {
                      var selectedGender = newValue;
                    });
                  },
                ),
                SizedBox(height: 16),
                BirthdayInput(
                  onDateSelected: (date) {
                    setState(() {
                      var selectedDate = date;
                    });
                  },
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 69, 244,
                              139), // Mengatur warna latar belakang tombol menjadi hijau
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
                        child: ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Color.fromARGB(0, 0, 0,
                                0), // Hapus warna latar belakang bawaan tombol
                            elevation:
                                0, // Setel nilai elevasi bawaan tombol menjadi 0
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            child: Text(
                              'SELESAI',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Develop By Co",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  "nst",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
