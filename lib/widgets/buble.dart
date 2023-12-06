import 'package:flutter/material.dart';
import 'package:scroller_chat/constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
       margin:const  EdgeInsets.all(8),
       padding:const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: const Text(
          'Hedsadsadasdllo',style: TextStyle(color: Colors.white,fontSize: 16),
        ),
      ),
    );
  }
}
