import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;

  AvatarWidget({required this.imageUrl, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(imageUrl),
        ),
        Container(
          width: 25,
          height: 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              isOnline ? 'Online' : 'Offline',
              style: TextStyle(
                color: isOnline ? Colors.green : Colors.black,
                fontSize: 8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
