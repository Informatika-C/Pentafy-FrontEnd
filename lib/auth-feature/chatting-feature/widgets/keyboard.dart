// import 'package:flutter/material.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

// class EmojiPickerWidget extends StatefulWidget {
//   @override
//   _EmojiPickerWidgetState createState() => _EmojiPickerWidgetState();
// }

// class _EmojiPickerWidgetState extends State<EmojiPickerWidget> {
//   bool _isEmojiVisible = false;
//   TextEditingController _textEditingController = TextEditingController();

//   void _toggleEmojiKeyboard() {
//     setState(() {
//       _isEmojiVisible = !_isEmojiVisible;
//     });
//   }

//   void _onEmojiSelected(Emoji emoji) {
//     _textEditingController.value = TextEditingValue(
//       text: _textEditingController.text + emoji.emoji,
//       selection: TextSelection.fromPosition(
//         TextPosition(
//             offset: _textEditingController.text.length + emoji.emoji.length),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: _textEditingController,
//                   decoration: InputDecoration(
//                     hintText: 'Ketik pesan di sini...',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         _isEmojiVisible
//             ? EmojiPicker(
//                 onEmojiSelected: _onEmojiSelected,
//               )
//             : SizedBox(),
//         ElevatedButton(
//           onPressed: _toggleEmojiKeyboard,
//           child: Text(
//               _isEmojiVisible ? 'Tutup Emoji Keyboard' : 'Buka Emoji Keyboard'),
//         ),
//       ],
//     );
//   }
// }
