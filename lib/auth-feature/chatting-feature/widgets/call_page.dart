import 'package:flutter/material.dart';

class VoiceCallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Call'),
        // Customize your app bar as needed
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              // Add the user's profile picture here
              radius: 50,
              // backgroundImage: NetworkImage('URL_OF_PROFILE_PICTURE'),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe', // Replace with the name of the user you're calling
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Calling...', // You can change the call status based on the call state
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            IconButton(
              icon: Icon(Icons.call_end),
              color: Colors.red,
              iconSize: 48,
              onPressed: () {
                // Implement the logic to end the call
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Now, you can use this VoiceCallPage widget in your main application code or any other appropriate place.
