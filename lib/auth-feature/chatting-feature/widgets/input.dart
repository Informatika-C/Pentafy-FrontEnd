import 'package:flutter/material.dart';
import 'overlay.dart';
import '../../group-chat/group-chat.dart';

class MessageInputWidget extends StatefulWidget {
  final Function(String) onSendMessage;

  MessageInputWidget({required this.onSendMessage});

  @override
  _MessageInputWidgetState createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  TextEditingController _textEditingController = TextEditingController();
  void _sendMessage() {
    String message = _textEditingController.text.trim();
    if (message.isNotEmpty) {
      widget.onSendMessage(message);
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          OverlayWidget(),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.file_open),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatGroup()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  // void _sendMessage() {
  //   String message = _textEditingController.text.trim();
  //   if (message.isNotEmpty) {
  //     widget.onSendMessage(message);
  //     _textEditingController.clear();
  //   }
  // }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
