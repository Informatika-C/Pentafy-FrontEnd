import 'package:flutter/material.dart';
import '../../group-chat/group-chat.dart';

class HamburgerMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {
        _openPopupMenu(context);
      },
    );
  }

  void _openPopupMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final Offset topRight =
        Offset(overlay.size.width - kToolbarHeight, kToolbarHeight + 40);
    final RelativeRect position =
        RelativeRect.fromLTRB(topRight.dx, topRight.dy, 0, 0);

    await showMenu(
      context: context,
      position: position,
      items: [
        _buildMenuItem(context, Icons.call, 'Call'),
        _buildMenuItem(context, Icons.video_call, 'Video Call'),
        _buildMenuItem(context, Icons.photo, 'Media'),
        _buildMenuItem(context, Icons.notifications, 'Notification'),
        _buildMenuItem(context, Icons.color_lens, 'Change Color'),
        _buildMenuItem(context, Icons.delete, 'Delete Chat'),
      ],
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  PopupMenuItem _buildMenuItem(
      BuildContext context, IconData icon, String title) {
    return PopupMenuItem(
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
      onTap: () {
        _onMenuItemSelected(context, title);
      },
    );
  }

  void _onMenuItemSelected(BuildContext context, String title) {
    Navigator.pop(context); // Close the popup menu after the selection is made

    // Navigate to the appropriate page based on the selected title
    if (title == 'Call') {
      // Replace 'CallScreen' with the name of the destination screen for the 'Call' option
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatGroup()),
      );
    } else if (title == 'Video Call') {
      // Replace 'VideoCallScreen' with the name of the destination screen for the 'Video Call' option
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatGroup()),
      );
    } else if (title == 'Media') {
      // Replace 'MediaScreen' with the name of the destination screen for the 'Media' option
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatGroup()),
      );
    } else if (title == 'Notification') {
      // Replace 'NotificationScreen' with the name of the destination screen for the 'Notification' option
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatGroup()),
      );
    } else if (title == 'Change Color') {
      // Replace 'ChangeColorScreen' with the name of the destination screen for the 'Change Color' option
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatGroup()),
      );
    } else if (title == 'Delete Chat') {
      // Replace 'DeleteChatScreen' with the name of the destination screen for the 'Delete Chat' option
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatGroup()),
      );
    }
  }

  // void _onMenuItemSelected(BuildContext context, String item) {
  //   // Aksi yang ingin Anda lakukan ketika item menu di-tap
  //   switch (item) {
  //     case "Call":
  //       _showSnackbar(context, "Call menu di-tap");
  //       break;
  //     case "Video Call":
  //       _showSnackbar(context, "Video Call menu di-tap");
  //       break;
  //     case "Media":
  //       _showSnackbar(context, "Media menu di-tap");
  //       break;
  //     case "Notification":
  //       _showSnackbar(context, "Notification menu di-tap");
  //       break;
  //     case "Change Color":
  //       _showSnackbar(context, "Change Color menu di-tap");
  //       break;
  //     case "Delete Chat":
  //       _showSnackbar(context, "Delete Chat menu di-tap");
  //       break;
  //   }
  // }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
