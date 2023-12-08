import 'package:scroller_chat/constants.dart';

class MessageModel {
  final String message;
  MessageModel(this.message);

  factory MessageModel.fromJson(json) {
    return MessageModel(json[kMessage]);
  }
}
