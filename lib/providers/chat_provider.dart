import 'package:flutter/material.dart';
import 'package:la_toxica/domain/entities/message.dart';
import 'package:la_toxica/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer _getYesNoAnswer = GetYesNoAnswer();
  final List<Message> messageList = [
  ];

  Future<void> sendMessage(String message) async {
    messageList.add(Message(text: message, imageUrl: null, fromWho: FromWho.me));
    if (message.endsWith('?')) {
      await herReply();
    }
    notifyListeners();
  }

  Future<void> herReply() async {
    final message = await _getYesNoAnswer.getAnswer();
    messageList.add(message);
    notifyListeners();
  }

}