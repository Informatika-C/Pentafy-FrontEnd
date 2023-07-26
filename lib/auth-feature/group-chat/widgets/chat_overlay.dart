// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BubbleChatPage(),
//     );
//   }
// }

// class BubbleChatPage extends StatefulWidget {
//   @override
//   _BubbleChatPageState createState() => _BubbleChatPageState();
// }

// class _BubbleChatPageState extends State<BubbleChatPage> {
//   OverlayEntry _overlayEntry;
//   bool _isOverlayVisible = false;

//   // Function to show the overlay
//   void showOverlay(BuildContext context) {
//     OverlayState overlayState = Overlay.of(context);
//     _overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         top: MediaQuery.of(context).size.height * 0.3,
//         left: MediaQuery.of(context).size.width * 0.2,
//         child: Material(
//           color: Colors.transparent,
//           child: Container(
//             width: 200,
//             height: 100,
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Text(
//                 'Ini adalah overlay',
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );

//     overlayState.insert(_overlayEntry);
//   }

//   // Function to hide the overlay
//   void hideOverlay() {
//     if (_overlayEntry != null) {
//       _overlayEntry.remove();
//       _overlayEntry = null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Bubble Chat with Overlay')),
//       body: Center(
//         child: GestureDetector(
//           onLongPress: () {
//             setState(() {
//               _isOverlayVisible = true;
//               showOverlay(context);
//             });
//           },
//           onLongPressEnd: (_) {
//             setState(() {
//               _isOverlayVisible = false;
//               hideOverlay();
//             });
//           },
//           child: AnimatedContainer(
//             duration: Duration(milliseconds: 100),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: _isOverlayVisible ? Colors.green : Colors.blue,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               'Ini adalah bubble chat',
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
