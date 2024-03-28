import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isCurrentUser;
  final String chatMsg;

  const ChatBubble({super.key,
  required this.chatMsg,
  required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
              child: chatMsg != '' && chatMsg != ''
                  ? Container(
                      padding:  EdgeInsets.all(8),
                      margin: EdgeInsets.only(
                          left: isCurrentUser ? 40 : 10,
                          right: isCurrentUser ? 10 : 40,
                          top: 5,
                          bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: isCurrentUser
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              )
                            : const BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                      ),
                      child: Text(chatMsg,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )))
                  : const SizedBox.shrink()),
        ],
      ),
    );
  }
}