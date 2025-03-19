import 'package:flutter/material.dart';
import 'package:la_toxica/presentation/widgets/chat/message_bubble.dart';
import 'package:la_toxica/presentation/widgets/chat/message_field_box.dart';
import 'package:la_toxica/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Toxica'),
        centerTitle: true,
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://www.perfocal.com/blog/content/images/size/w960/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg'),
        ),
      ),
      body: const _chatView(),
    );
  }
}

// ignore: camel_case_types
class _chatView extends StatelessWidget {
  const _chatView();

  @override
  Widget build(BuildContext context) {
    final chats = context.watch<ChatProvider>();
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: chats.messageList.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                      message: chats.messageList[index],
                    );
                  })),
          MessageFieldBox(onSend: (String value) => chats.sendMessage(value)),
        ],
      ),
    );
  }
}
