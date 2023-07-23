import 'package:flutter/material.dart';

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
        Navigator.pop(context); // Tutup menu hamburger setelah item di-tap
      },
    );
  }

  void _onMenuItemSelected(BuildContext context, String item) {
    // Aksi yang ingin Anda lakukan ketika item menu di-tap
    switch (item) {
      case "Call":
        _showSnackbar(context, "Call menu di-tap");
        break;
      case "Video Call":
        _showSnackbar(context, "Video Call menu di-tap");
        break;
      case "Media":
        _showSnackbar(context, "Media menu di-tap");
        break;
      case "Notification":
        _showSnackbar(context, "Notification menu di-tap");
        break;
      case "Change Color":
        _showSnackbar(context, "Change Color menu di-tap");
        break;
      case "Delete Chat":
        _showSnackbar(context, "Delete Chat menu di-tap");
        break;
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
