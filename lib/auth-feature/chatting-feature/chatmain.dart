import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/avatar.dart';
import 'widgets/menu.dart';
import 'widgets/input.dart';
import '../group-chat/group-chat.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme:
            GoogleFonts.hammersmithOneTextTheme(Theme.of(context).textTheme),
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class Message {
  String content;
  bool isSender;
  bool isRead; // Penanda pesan telah dibaca atau belum dibaca
  bool isFailed; // Penanda pesan gagal terkirim
  DateTime time;

  Message(this.content, this.isSender, this.isRead, this.isFailed, this.time);
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message("Halo!", true, true, false,
        DateTime.now().subtract(Duration(minutes: 10))),
    Message("Hai! Ada apa?", false, true, false,
        DateTime.now().subtract(Duration(minutes: 8))),
    Message("Sudah makan?", true, false, true,
        DateTime.now().subtract(Duration(minutes: 5))),
    Message("Belum, kamu sudah makan?", false, false, false,
        DateTime.now().subtract(Duration(minutes: 2))),
    Message("Sudah tentu! Saya makan nasi goreng tadi.", true, false, false,
        DateTime.now()),
  ];

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isContainerVisible = false;
  bool isOnline = false;

  void _sendMessage(String message) {
    setState(() {
      messages.add(Message(message, true, false, false, DateTime.now()));
      // Scroll to the bottom after sending the message
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    // Tambahkan listener pada ScrollController
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // Jangan lupa untuk membebaskan resources yang digunakan oleh ScrollController ketika state di-dispose
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Periksa apakah pengguna sudah mencapai bagian paling bawah dari chat
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      // Jika sudah mencapai, berhenti mengikuti chat terbaru
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            AvatarWidget(
              imageUrl: 'assets/images/a son of Indonesia.jpg',
              isOnline: true,
            ),
            SizedBox(width: 16),
            Text(
              'Yanto',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        toolbarHeight: 60,
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
      body: Container(
        color: Color(0xFF262A32),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  Message message = messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
            MessageInputWidget(onSendMessage: _sendMessage),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    BorderRadius borderRadius;
    if (message.isSender) {
      borderRadius = BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
        bottomLeft: Radius.circular(12),
      );
    } else {
      borderRadius = BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
        bottomRight: Radius.circular(12),
      );
    }

    return InkWell(
      onTap: () {
        // melakukan check jira pesan yg dikirim berupa URL
        if (Uri.tryParse(message.content)?.isAbsolute ?? false) {
          _launchURL(message.content);
        }
      },
      child: Stack(
        alignment:
            message.isSender ? Alignment.centerRight : Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: message.isSender ? Color(0xFF545559) : Color(0XFFF5F5DC),
              borderRadius: borderRadius,
            ),
            child: Column(
              crossAxisAlignment: message.isSender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  message.content,
                  style: GoogleFonts.lato(
                    color: message.isSender ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  _formatTime(message.time),
                  style: GoogleFonts.lato(
                    color: message.isSender ? Colors.white70 : Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (message.isSender) ...[
            Positioned(
              right: 10,
              bottom: 25,
              child: Column(
                children: [
                  SizedBox(
                      height: 24), // Untuk memberi jarak agar tampilan rapi
                  _buildReadStatus(message),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildReadStatus(Message message) {
    Color statusColor;
    // String statusText;
    if (message.isRead) {
      statusColor = Color(0XFF243AFF);
      // statusText = 'R';
    } else if (message.isFailed) {
      statusColor = Color(0XFFFF0000);
      // statusText = '!';
    } else {
      statusColor = Colors.white;
      // statusText = 'D';
    }

    return Container(
      width: 12,
      height: 12,
      // padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(2),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(0),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
