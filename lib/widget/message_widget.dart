import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final String translatedMessage;
  final bool isMe;

  const MessageWidget({super.key, 
    required this.message,
    required this.translatedMessage,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    const borderRadius = BorderRadius.all(radius);

    return Row(
      //To align at different positions based on if message is from the user or not
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
          decoration: BoxDecoration(
            color: isMe ? Colors.white : Theme.of(context).colorScheme.secondary,
            borderRadius: isMe
                ? borderRadius.subtract(const BorderRadius.only(bottomRight: radius))
                : borderRadius.subtract(const BorderRadius.only(bottomLeft: radius)),
          ),
          child: buildMessage(),
        ),
      ],
    );
  }

  Widget buildMessage() => Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.black54 : Colors.white70,
              fontSize: 14,
            ),
            textAlign: isMe ? TextAlign.end : TextAlign.start,
          ),
          Text(
            translatedMessage,
            style: TextStyle(
              color: isMe ? Colors.black87 : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: isMe ? TextAlign.end : TextAlign.start,
          ),
        ],
      );
}