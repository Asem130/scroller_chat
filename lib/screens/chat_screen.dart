import 'package:flutter/material.dart';
import 'package:scroller_chat/constants.dart';
import 'package:scroller_chat/helper/show_snackbar.dart';
import 'package:scroller_chat/model/message_model.dart';
import 'package:scroller_chat/widgets/buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
  static String id = 'ChatScreen';
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController controlleer =ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessage);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }

            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      height: 50,
                      width: 50,
                    ),
                    const Text('Chat'),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: controlleer,
                      itemBuilder: (context, index) {
                        return ChatBuble(message: messagesList[index]);
                      },
                      itemCount: messagesList.length,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onSubmitted: (data) {
                        messages.add(
                          {
                            kMessage: data,
                            kCreatedAt: DateTime.now(),
                          },
                        );
                        controller.clear();
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'send a message',
                        suffixIcon: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: kPrimaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: kPrimaryColor)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text('loading');
          }
        });
  }
}
