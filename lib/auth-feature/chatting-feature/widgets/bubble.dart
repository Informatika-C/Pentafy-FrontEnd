import 'dart:io'; // Import this for using File class
import 'package:flutter/material.dart';

class BubbleChatWidget extends StatelessWidget {
  final String message;
  final bool isMe;
  final DateTime time;
  final MessageStatus status; // Tambahkan properti status
  final File? imageFile; // Add imageFile property to handle image message
  final File? videoFile; // Add videoFile property to handle video message

  BubbleChatWidget({
    required this.message,
    required this.isMe,
    required this.time,
    required this.status,
    this.imageFile,
    this.videoFile,
  });

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
          if (message.isNotEmpty)
            Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          if (imageFile != null) // Display image if imageFile is provided
            Image.file(
              imageFile!,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          if (videoFile != null) // Display video if videoFile is provided
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayerWidget(videoFile!),
            ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Text(
                _formatTime(time),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 4),
              _buildStatusIcon(status),
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
      return SizedBox();
    }
  }
}

enum MessageStatus {
  sent,
  delivered,
  error,
}

// Add VideoPlayerWidget to display the video file
class VideoPlayerWidget extends StatelessWidget {
  final File videoFile;

  VideoPlayerWidget(this.videoFile);

  @override
  Widget build(BuildContext context) {
    // Implement your video player widget here
    // You can use any video player plugin of your choice to display the video
    return SizedBox(); // Replace this with your actual video player implementation
  }
}
