import 'package:flutter/material.dart';
import 'call_page.dart';

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
      child: Container(
        color: Colors.yellow,
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
      ),
      onTap: () {
        _onMenuItemSelected(context, title);
        Navigator.pop(context); // Tutup menu hamburger setelah item di-tap
      },
    );
  }

  void _onMenuItemSelected(BuildContext context, String title) {
    switch (title) {
      case "Camera":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VoiceCallPage(), // Ganti dengan halaman yang sesuai
          ),
        );
        break;
      case "File":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VoiceCallPage(), // Ganti dengan halaman yang sesuai
          ),
        );
        break;
      case "Image":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VoiceCallPage(), // Ganti dengan halaman yang sesuai
          ),
        );
        break;
      case "Contacts":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VoiceCallPage(), // Ganti dengan halaman yang sesuai
          ),
        );
        break;
      case "Location":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VoiceCallPage(), // Ganti dengan halaman yang sesuai
          ),
        );
        break;
      default:
        break;
    }
  }
}
