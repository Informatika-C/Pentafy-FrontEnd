import 'package:flutter/material.dart';
import 'overlay.dart';

class MessageInputWidget extends StatelessWidget {
  final Function(String message, Color nameColor) onSendMessage;

  MessageInputWidget({required this.onSendMessage});

  final TextEditingController _textEditingController = TextEditingController();
  Color _nameColor = Colors.blue; // Ganti warna sesuai dengan kebutuhan

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
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.file_open),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (_textEditingController.text.trim().isEmpty) return;
              onSendMessage(
                _textEditingController.text,
                _nameColor,
              );
              _textEditingController.clear();
            },
          ),
        ],
      ),
    );
  }
}
