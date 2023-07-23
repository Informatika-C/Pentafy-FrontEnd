import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pentafy/auth-feature/screens/register_screen.dart';

import '../widgets/costum_button_widget.dart';
import '../widgets/logo_widget.dart';
import '../widgets/screen_container_widget.dart';
import '../widgets/text_input_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Untuk sementara, kita hanya mencetak email, password, dan nilai rememberMe
    print('Email: $email');
    print('Password: $password');
  }

  void _klikdisini() {
    print('Tombol "Lupa Password?" diklik');
  }

  void _daftar() {
    Get.to(() => RegisterScreen());
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
                  labelText: "Password",
                  hintText: "Masukkan Password",
                  obscureText: !_passwordVisible,
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
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CostumButton(
                      text: 'MASUK',
                      onPressed: _login,
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
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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
                        onPressed: _daftar,
                        child: Text(
                          "DAFTAR",
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
