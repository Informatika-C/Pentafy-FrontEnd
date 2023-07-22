import 'package:flutter/material.dart';

class Av extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AvBar(),
        body: Center(
          child: Text("Halaman Utama"),
        ),
      ),
    );
  }
}

class AvBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          Avatar(),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Pengguna",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
              'assets/images/a son of Indonesia.jpg'), // Ganti dengan path gambar avatar Anda
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: OnlineStatus(isOnline: true),
            ),
          ),
        ],
      ),
    );
  }
}

class OnlineStatus extends StatelessWidget {
  final bool isOnline;

  OnlineStatus({required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Text(
      isOnline ? "Online" : "Offline",
      style: TextStyle(
        color: isOnline ? Colors.green : Colors.grey,
        fontSize: 6,
      ),
    );
  }
}
