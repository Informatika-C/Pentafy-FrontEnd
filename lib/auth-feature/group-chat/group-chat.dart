import 'package:flutter/material.dart';
import 'widgets/bubble.dart';
import 'widgets/input.dart';
import 'widgets/avatar.dart';
import 'widgets/menu.dart';

class ChatGroup extends StatefulWidget {
  @override
  _ChatGroupState createState() => _ChatGroupState();
}

class _ChatGroupState extends State<ChatGroup> {
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'Alice',
      'message': 'Halo!',
      'nameColor': Colors.red, // Ganti warna sesuai dengan kebutuhan
      'time': '09:00 AM',
    },
    {
      'sender': 'Bob',
      'message': 'Hai, apa kabar?',
      'nameColor': Colors.blue, // Ganti warna sesuai dengan kebutuhan
      'time': '09:30 AM',
    },
    {
      'sender': 'Charlie',
      'message': 'Saya baik, terima kasih!',
      'nameColor': Colors.green, // Ganti warna sesuai dengan kebutuhan
      'time': '10:00 AM',
    },
    {
      'sender': 'Alice',
      'message': 'Ada yang bisa saya bantu?',
      'nameColor': Colors.red, // Ganti warna sesuai dengan kebutuhan
      'time': '10:15 AM',
    },
  ];

  void _sendMessage(String message, Color nameColor) {
    setState(() {
      messages.add({
        'sender': 'You', // Nama Anda atau pengirim pesan
        'message': message,
        'nameColor': nameColor,
        'time': '12:34 PM',
        'isMe': true,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF262A32),
      appBar: AppBar(
        title: Row(
          children: [
            AvatarWidget(
              imageUrl: 'assets/images/a son of Indonesia.jpg',
            ),
            SizedBox(width: 16),
            Text(
              'GROUP MABAR FF',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        toolbarHeight: 70,
        backgroundColor: Color(0XFF1261AA),
        titleSpacing: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          HamburgerMenuWidget(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final sender = message['sender'];
                final msg = message['message'];
                final nameColor = message['nameColor'];
                final time = message['time'];
                final isMe = message['isMe'] ?? false;

                return BubleChat(
                  sender: sender,
                  message: msg,
                  nameColor: nameColor,
                  time: time,
                  isMe: isMe,
                );
              },
            ),
          ),
          MessageInputWidget(
            onSendMessage: _sendMessage,
          ),
        ],
      ),
    );
  }
}
