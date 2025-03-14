import 'package:flutter/material.dart';
import 'package:la_toxica/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> messageList = [
    Message(text: "Vamos por tacos?", imageUrl: null, fromWho: FromWho.me),
    Message(text: "No?", imageUrl: 'https://yesno.wtf/assets/no/8-5e08abbe5aacd2cf531948145b787e9a.gif', fromWho: FromWho.hers),
    Message(text: "Bien bien", imageUrl: null, fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String message) async {
    messageList.add(Message(text: message, imageUrl: null, fromWho: FromWho.me));
    notifyListeners();
  }

}