import 'package:flutter/material.dart';
import 'package:scroller_chat/constants.dart';
import 'package:scroller_chat/widgets/buble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
  static String id = 'ChatScreen';
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scholar.png',
              height: 50,
              width: 50,
            ),
            const Text('Chat'),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const ChatBuble(),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
