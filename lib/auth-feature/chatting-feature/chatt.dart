import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/keyboard.dart';

class ChattingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme:
            GoogleFonts.hammersmithOneTextTheme(Theme.of(context).textTheme),
      ),
      title: 'Chatting Page',
      home: ChattingPage(),
    );
  }
}

class ChattingPage extends StatefulWidget {
  @override
  _ChattingPageState createState() => _ChattingPageState();
}

class Message {
  String content;
  bool isSender;
  bool isRead; // Penanda pesan telah dibaca atau belum dibaca
  bool isFailed; // Penanda pesan gagal terkirim
  DateTime time;

  Message(this.content, this.isSender, this.isRead, this.isFailed, this.time);
}

class _ChattingPageState extends State<ChattingPage> {
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

  void _toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
    });
  }

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isContainerVisible = false;
  bool isOnline = false;

  void _sendMessage() {
    setState(() {
      String message = messageController.text.trim();
      if (message.isNotEmpty) {
        messages.add(Message(message, true, false, false, DateTime.now()));
        messageController.clear();
        // Setelah pesan terkirim, gulir ke bagian paling bawah ListView
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
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

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 0, 0),
      items: [
        _buildMenuItem(Icons.call, "Call"),
        _buildMenuItem(Icons.video_call, "Video Call"),
        _buildMenuItem(Icons.perm_media, "Media"),
        _buildMenuItem(Icons.notifications, "Notification"),
        _buildMenuItem(Icons.color_lens, "Change Color"),
        _buildMenuItem(Icons.delete, "Delete Chat"),
      ],
    );
  }

  bool isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0XFF1261AA),
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            _buildAvatar(isOnline: isOnline),
            SizedBox(width: 16),
            Text(
              'Yanto',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isMenuOpen ? Icons.close : Icons.menu),
            onPressed: () {
              _showPopupMenu();
              _toggleMenu();
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF262A32),
        child: Stack(
          children: [
            Column(
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
                _buildMessageInputField(),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              bottom: isContainerVisible
                  ? 100
                  : -250, // Adjust the bottom value as needed
              left: 0,
              right: 0,
              child: _buildExpandedContainer(),
            ),
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

    return Stack(
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
                SizedBox(height: 24), // Untuk memberi jarak agar tampilan rapi
                _buildReadStatus(message),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildAvatar({required bool isOnline}) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/a son of Indonesia.jpg'),
          radius: 22,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 30,
            height: 15,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: Text(
              isOnline
                  ? 'Online'
                  : 'Offline', // Ubah keterangan sesuai dengan status
              style: TextStyle(
                color: isOnline
                    ? Colors.green
                    : Colors.black, // Ubah warna teks sesuai dengan status
                fontSize: 9,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onMenuItemSelected(String item) {
    // Aksi yang ingin Anda lakukan ketika item menu di-tap
    // Misalnya, implementasi untuk setiap item menu
    switch (item) {
      case "Call":
        _showSnackbar("Call menu di-tap"); // Contoh aksi untuk "Call" menu
        break;
      case "Video Call":
        _showSnackbar(
            "Video Call menu di-tap"); // Contoh aksi untuk "Video Call" menu
        break;
      case "Media":
        _showSnackbar("Media menu di-tap"); // Contoh aksi untuk "Media" menu
        break;
      case "Notification":
        _showSnackbar(
            "Notification menu di-tap"); // Contoh aksi untuk "Notification" menu
        break;
      case "Change Color":
        _showSnackbar(
            "Change Color menu di-tap"); // Contoh aksi untuk "Change Color" menu
        break;
      case "Delete Chat":
        _showSnackbar(
            "Delete Chat menu di-tap"); // Contoh aksi untuk "Delete Chat" menu
        break;
    }

    // Setelah item menu dipilih, tutup menu hamburger
    _toggleMenu();
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  PopupMenuItem _buildMenuItem(IconData icon, String title) {
    return PopupMenuItem(
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
      onTap: () {
        // Aksi ketika item di-tap
        // Contoh: Tampilkan aksi sesuai dengan item yang dipilih
        _onMenuItemSelected(title);
      },
    );
  }

  Widget _buildReadStatus(Message message) {
    Color statusColor;
    String statusText;
    if (message.isRead) {
      statusColor = Color(0XFF243AFF); // Pesan dibaca
      statusText = 'R';
    } else if (message.isFailed) {
      statusColor = Color(0XFFFF0000); // Pesan gagal terkirim
      statusText = '!';
    } else {
      statusColor = Colors.white; // Pesan belum dibaca
      statusText = 'D';
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

  Widget _buildMessageInputField() {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0XFF1261AA),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                  isContainerVisible ? Icons.cancel_rounded : Icons.add_circle),
              onPressed: _toggleContainerVisibility,
            ),
            Expanded(
              child: Container(
                height: 34, // Ubah tinggi (height) sesuai keinginan Anda
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Ketik pesan...',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black), // Warna border
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.emoji_emotions),
              onPressed: () {
                // Aksi ketika ikon emotikon di-tap
                // Contoh: Tampilkan opsi untuk memilih emotikon
              },
            ),
            IconButton(
              icon: Icon(
                Icons.send_rounded,
                size: 30,
              ),
              onPressed: _sendMessage,
              color: Color(0XFF0C6DB4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedContainer() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.add_circle),
      onSelected: (String result) {
        // Aksi ketika salah satu opsi media di-tap
        // Contoh: Tampilkan aksi sesuai dengan opsi yang dipilih
        _onMediaOptionSelected(result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        _buildMediaOption(Icons.camera, "Camera"),
        _buildMediaOption(Icons.insert_drive_file, "File"),
        _buildMediaOption(Icons.image, "Image"),
        _buildMediaOption(Icons.contacts, "Contacts"),
        _buildMediaOption(Icons.location_on, "Location"),
      ],
    );
  }

  void _onMediaOptionSelected(String option) {
    // Aksi yang ingin Anda lakukan ketika opsi media di-tap
    // Misalnya, implementasi untuk setiap opsi media
    switch (option) {
      case "Camera":
        _showSnackbar("Camera option selected");
        break;
      case "File":
        _showSnackbar("File option selected");
        break;
      case "Image":
        _showSnackbar("Image option selected");
        break;
      case "Contacts":
        _showSnackbar("Contacts option selected");
        break;
      case "Location":
        _showSnackbar("Location option selected");
        break;
    }

    // Setelah opsi media dipilih, tutup menu pop-up
    Navigator.pop(context);
  }

  PopupMenuEntry<String> _buildMediaOption(IconData icon, String title) {
    return PopupMenuItem<String>(
      value: title,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildActionRow(IconData icon) {
    return InkWell(
      onTap: () {
        T();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon,
                  color: Colors.black), // Set the icon color to white
            ),
          ],
        ),
      ),
    );
  }
}
