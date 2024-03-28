import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chats'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 5,
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          child: Text('U'),
                        ),
                      ),
                      title: Text(
                        'username',
                        style: const TextStyle(
                          letterSpacing: 3,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    onTap: () {});
              }),
        ));
  }
}
