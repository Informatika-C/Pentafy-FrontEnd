import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pentafy/auth-feature/widgets/screen_container_widget.dart';

import '../widgets/costum_button_widget.dart';
import '../widgets/logo_widget.dart';
import '../widgets/text_input_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _konfirmasiController = TextEditingController();
  bool passwordVisible = false;

  void _register() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String konfirmasi = _konfirmasiController.text;

    // Untuk sementara, kita hanya mencetak email, password, dan nilai rememberMe
    print('Email: $email');
    print('Password: $password');
    print('Konfirmasi: $konfirmasi');
  }

  void _login() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: ScreenContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LogoWidget(),
            Column(
              children: [
                SizedBox(height: 16),
                TextInputWidget(
                  textController: _emailController,
                  labelText: 'Username/Email',
                  hintText: 'Masukkan Username/Email ',
                ),
                SizedBox(height: 16),
                TextInputWidget(
                  textController: _passwordController,
                  labelText: 'Password',
                  hintText: 'Masukkan Password',
                  obscureText: !passwordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      !passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                TextInputWidget(
                  textController: _konfirmasiController,
                  labelText: 'Konfirmasi Password',
                  hintText: 'Masukkan Konfirmasi Password',
                  obscureText: !passwordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      !passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CostumButton(
                      text: "DAFTAR",
                      onPressed: _register,
                    ),
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
                    TextButton(
                        onPressed: _login,
                        child: Text(
                          "MASUK",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
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
