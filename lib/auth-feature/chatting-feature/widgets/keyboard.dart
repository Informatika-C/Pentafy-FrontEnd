import 'package:flutter/material.dart';

class T extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inputan dan Dropdown Example'),
        ),
        body: Center(
          child: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _password = '';
  String _gender = 'Male';

  List<String> _genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value ?? '';
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) {
                _password = value ?? '';
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _gender,
              onChanged: (newValue) {
                setState(() {
                  _gender = newValue ?? 'Male';
                });
              },
              items: _genderOptions.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _submitForm();
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    print('Name: $_name');
    print('Password: $_password');
    print('Gender: $_gender');
    // Di sini Anda dapat melakukan aksi lain yang ingin Anda lakukan setelah mengisi form.
  }
}

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
