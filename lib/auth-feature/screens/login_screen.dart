import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pentafy/auth-feature/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      '/icon/icon.png',
                      width: 150,
                      height: 150,
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
                        color: Colors
                            .white, // Mengatur warna latar belakang tombol menjadi hijau
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
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Mengatur warna latar belakang tombol menjadi hijau
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
                        controller: _passwordController,
                        obscureText:
                            !_passwordVisible, //This will obscure text dynamically
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Password',
                          hintText: 'Masukkan password',
                          contentPadding: EdgeInsets.only(left: 10),
                          // Here is key idea
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on _passwordVisible state choose the icon
                              !_passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of _passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          side: MaterialStateBorderSide.resolveWith(
                            (states) =>
                                BorderSide(width: 1.0, color: Colors.white),
                          ),
                          value: _rememberMe,
                          onChanged:
                              _onRememberMeChanged, // Nama fungsi yang sudah diperbaiki
                        ),
                        Text(
                          'Simpan Kata Sandi !',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Get.theme.colorScheme
                                .tertiary, // Mengatur warna latar belakang tombol menjadi hijau
                            borderRadius: BorderRadius.circular(
                                8), // Mengatur radius border tombol
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 0, 0,
                                    0), // Warna dan opasitas bayangan
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
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                'MASUK',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Lupa Password ?',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: _klikdisini,
                            child: Text(
                              'Klik Disini',
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                    SizedBox(height: 16),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Text(
                          "Belum Punya Akun ?",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                            onPressed: _daftar,
                            child: Text(
                              "DAFTAR",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))
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
        ),
      ),
    );
  }

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

  void _daftar() {
    Get.to(RegisterScreen());
  }
}
