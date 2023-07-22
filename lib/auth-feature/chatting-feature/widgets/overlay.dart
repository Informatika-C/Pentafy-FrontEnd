import 'package:flutter/material.dart';

class OverlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.add_circle),
        onPressed: () {
          _openPopupMenu(context);
        },
      ),
    );
  }

  void _openPopupMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final Offset bottomLeft = Offset(
      overlay.size.width / 12,
      overlay.size.height / 1.5,
    );
    final RelativeRect position = RelativeRect.fromSize(
      Rect.fromCenter(center: bottomLeft, width: 40, height: 120),
      overlay.size,
    );

    await showMenu(
      context: context,
      position: position,
      items: [
        _buildMenuItem(context, Icons.camera, "Camera"),
        _buildMenuItem(context, Icons.insert_drive_file, "File"),
        _buildMenuItem(context, Icons.image, "Image"),
        _buildMenuItem(context, Icons.contacts, "Contacts"),
        _buildMenuItem(context, Icons.location_on, "Location"),
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
            size: 30,
          ),
          // Text(title),
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
      case "Camera":
        _showSnackbar(context, "Camera option selected");
        break;
      case "File":
        _showSnackbar(context, "File option selected");
        break;
      case "Image":
        _showSnackbar(context, "Image option selected");
        break;
      case "Contacts":
        _showSnackbar(context, "Contacts option selected");
        break;
      case "Location":
        _showSnackbar(context, "Location option selected");
        break;
    }

    Navigator.pop(context);
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
