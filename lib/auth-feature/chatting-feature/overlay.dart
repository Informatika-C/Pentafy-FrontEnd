import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  OverlayEntry? _overlayEntry;

  void _handleTapDown(TapDownDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final tapPosition = renderBox.globalToLocal(details.globalPosition);

    // Remove previous overlay if any
    _removeOverlay();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: tapPosition.dx,
        top: tapPosition.dy,
        child: Container(
          width: 150,
          height: 100,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconWithTap(
                icon: Icons.call,
                onTap: () {
                  print('Call icon tapped!');
                  _removeOverlay();
                },
              ),
              IconWithTap(
                icon: Icons.message,
                onTap: () {
                  print('Message icon tapped!');
                  _removeOverlay();
                },
              ),
              IconWithTap(
                icon: Icons.video_call,
                onTap: () {
                  print('Video call icon tapped!');
                  _removeOverlay();
                },
              ),
            ],
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: GestureDetector(
        onTapDown: _handleTapDown,
        child: Stack(
          children: [
            ChatBox(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _removeOverlay(); // Ensure overlay is removed when the screen is disposed.
    super.dispose();
  }
}

class ChatBox extends StatelessWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: Text(
        'This is a chat message box!',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class IconWithTap extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const IconWithTap({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 32, color: Colors.black),
    );
  }
}
