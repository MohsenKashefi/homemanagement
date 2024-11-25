import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // This should be a list of maps to store both the message text and the sender information
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(bool isSentByMe) {
    if (_controller.text.isNotEmpty) {
      setState(() {
        // Add a message with its sender information to the list
        _messages.add({
          'text': _controller.text,
          'isSentByMe': isSentByMe,
        });
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isSentByMe = message['isSentByMe'];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Align(
                    alignment: isSentByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color:
                            isSentByMe ? Colors.blueAccent : Colors.greenAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        message['text'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(true),
                ),
                IconButton(
                  icon: Icon(Icons.reply),
                  onPressed: () => _sendMessage(false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
