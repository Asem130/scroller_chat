import 'package:flutter/material.dart';
import 'package:scroller_chat/constants.dart';
import 'package:scroller_chat/model/message_model.dart';

class FChatBuble extends StatelessWidget {
  const FChatBuble({
    super.key,
    required this.message,
  });
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 191, 145, 218),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Text(
          message.message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}