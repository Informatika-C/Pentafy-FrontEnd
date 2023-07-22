import 'package:flutter/material.dart';

class BubbleChatWidget extends StatelessWidget {
  final String message;
  final bool isMe;
  final DateTime time;
  final MessageStatus status; // Tambahkan properti status

  BubbleChatWidget(
      {required this.message,
      required this.isMe,
      required this.time,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isMe ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Text(
                _formatTime(time), // Panggil _formatTime dengan benar
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 4),
              _buildStatusIcon(status), // Panggil _buildStatusIcon dengan benar
            ],
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Widget _buildStatusIcon(MessageStatus status) {
    if (status == MessageStatus.sent) {
      return Icon(Icons.check_circle, color: Colors.white, size: 14);
    } else if (status == MessageStatus.delivered) {
      return Icon(Icons.done_all, color: Colors.white, size: 14);
    } else if (status == MessageStatus.error) {
      return Icon(Icons.error_outline, color: Colors.white, size: 14);
    } else {
      return SizedBox(); // Return an empty SizedBox if status is not defined
    }
  }
}

enum MessageStatus {
  sent,
  delivered,
  error,
}
