import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ChatItem {
  final String username;
  final String status;
  final bool isPinned;
  final String message;
  int unreadMessage;
  final DateTime time;

  ChatItem({
    required this.username,
    required this.status,
    required this.isPinned,
    required this.message,
    this.unreadMessage = 0,
    required this.time,
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ChatItem> chatList = [
    ChatItem(
      username: 'Fajar Kumolonimbus',
      status: 'online',
      isPinned: false,
      message: 'hallo mamang racing, mari kita hunting bersama mencari loli bersama adit dan parhan dan adib juga',
      unreadMessage: 0,
      time: DateTime.now(),
    ),
    ChatItem(
      username: 'JaneSmith',
      status: 'coding',
      isPinned: false,
      message: 'Hi, how are you?',
      unreadMessage: 20,
      time: DateTime.now(),
    ),
    ChatItem(
      username: 'Farhan',
      status: 'idle',
      isPinned: false,
      message: 'Hi, how are you?',
      unreadMessage: 2,
      time: DateTime.now(),
    ),
    // Add more ChatItem as needed
  ];

  void sortByUsername() {
    chatList.sort((a, b) => a.username.compareTo(b.username));
    setState(() {});
  }

  void sortByUnreadMessage() {
    chatList.sort((a, b) => b.unreadMessage.compareTo(a.unreadMessage));
    setState(() {});
  }

  void sortByTime() {
    chatList.sort((a, b) => a.time.compareTo(b.time));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(chatList[index].username[0]),
              ),
              title: Text(chatList[index].username),
              subtitle: Text(chatList[index].message),
              trailing: chatList[index].unreadMessage > 0
                  ? Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        chatList[index].unreadMessage.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : null,
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: sortByUsername,
                child: Text('Sortir Nama'),
              ),
              TextButton(
                onPressed: sortByUnreadMessage,
                child: Text('Sortir Unread'),
              ),
              TextButton(
                onPressed: sortByTime,
                child: Text('Sortir Jam'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
