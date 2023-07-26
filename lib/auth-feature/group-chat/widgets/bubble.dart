import 'package:flutter/material.dart';

class BubleChat extends StatefulWidget {
  final String sender;
  final String message;
  final Color nameColor;
  final String time;
  final bool isMe;

  BubleChat({
    required this.sender,
    required this.message,
    required this.nameColor,
    required this.time,
    required this.isMe,
  });

  @override
  _BubleChatState createState() => _BubleChatState();
}

class _BubleChatState extends State<BubleChat> {
  List<String> _reactions = [
    '👍', // Emot thumbs up
    '😄', // Emot happy face
    '😢', // Emot sad face
    '😲', // Emot surprised face
  ];
  Map<String, int>? _selectedReaction;
  List<String> _reactionUsers = []; // Daftar siapa saja yang melakukan reaction
  Map<String, int> _reactionCount = {}; // Jumlah reaction untuk setiap emot

  void _removeReaction(String user) {
    setState(() {
      _selectedReaction = null;
      _reactionUsers.remove(user);
      _updateReactionCount();
    });
    Navigator.of(context)
        .pop(); // Close the bottom sheet after removing the reaction.
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isMe ? Alignment.topRight : Alignment.topLeft,
      child: GestureDetector(
        onTapUp: (details) {
          final RenderBox overlay =
              Overlay.of(context).context.findRenderObject() as RenderBox;
          showMenu(
            context: context,
            position: RelativeRect.fromRect(
              Rect.fromPoints(
                details.globalPosition,
                details.globalPosition,
              ),
              Offset.zero & overlay.size,
            ),
            items: _reactions.map((reaction) {
              return PopupMenuItem(
                value: reaction,
                child: Text(reaction),
              );
            }).toList(),
          ).then((value) {
            if (value != null) {
              setState(() {
                _selectedReaction = {
                  _reactions.firstWhere((r) => r == value): 1
                };
                _reactionUsers
                    .add(widget.sender); // Tambah pengguna ke daftar reaction
                _updateReactionCount();
              });
            }
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment:
                widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                // margin: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: widget.isMe ? Color(0XFFF5F5DC) : Color(0xFF545559),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.isMe ? 20 : 0),
                    topRight: Radius.circular(widget.isMe ? 0 : 20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: widget.isMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.sender,
                      style: TextStyle(
                        color: widget.isMe
                            ? Colors.blue
                            : Colors.red, // Ubah warna sesuai dengan kebutuhan
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.message,
                      style: TextStyle(
                        color: widget.isMe ? Colors.black : Colors.white,
                      ),
                    ),
                    Text(
                      widget.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              if (_selectedReaction != null)
                GestureDetector(
                  onTap: () {
                    _showReactionList(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0XFF1261AA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _formatReactionText(),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatReactionText() {
    if (_selectedReaction == null) return '';
    String emoticon = _selectedReaction!.keys.first;
    int count = _selectedReaction![emoticon] ?? 1;
    return '$emoticon $count';
  }

  void _updateReactionCount() {
    _reactionCount.clear();
    for (var user in _reactionUsers) {
      if (_reactionCount.containsKey(user)) {
        _reactionCount[user] = _reactionCount[user]! + 0;
      } else {
        _reactionCount[user] = 1;
      }
    }
  }

  void _showReactionList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: _reactionCount.length,
          itemBuilder: (context, index) {
            var user = _reactionCount.keys.toList()[index];
            var count = _reactionCount[user]!;
            var reaction = _reactions.firstWhere(
                (element) => element == _selectedReaction!.keys.first);

            return ListTile(
              leading: Text(reaction),
              title: Text(user),
              subtitle: Text('Reaction count: $count'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _removeReaction(user),
              ),
            );
          },
        );
      },
    );
  }
}
