import 'package:flutter/material.dart';

class ChatImageBubble extends StatelessWidget {
  final String chatImage;
  final bool isCurrentUser;
  final String caption;
  const ChatImageBubble(
      {super.key, required this.chatImage, required this.isCurrentUser, required this.caption});

  @override
  Widget build(BuildContext context) {
    return chatImage != ''
        ? Align(
            alignment:
                isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: isCurrentUser
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.only(
                      left: isCurrentUser ? 40 : 10,
                      right: isCurrentUser ? 10 : 40,
                      top: 5,
                      bottom: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        if (chatImage != '')
                          GestureDetector(
                              child: Image.network(
                                chatImage,
                                fit: BoxFit.cover,
                                height: 200,
                                width: double.infinity,
                              ),
                              onTap: () {
                                // Handle image tap here
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) => ImageScreen(
                                //               imageUrl: chatImage,
                                //             )));
                              }),
                              const SizedBox(height: 2),

                        caption != ''
                            ? Text(
                                caption,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}