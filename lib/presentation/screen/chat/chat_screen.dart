import 'package:flutter/material.dart';
import 'package:la_toxica/domain/entities/message.dart';
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
              'https://scontent.felp1-1.fna.fbcdn.net/v/t39.30808-1/445014234_10230507014314335_5464072788898987830_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=104&ccb=1-7&_nc_sid=e99d92&_nc_eui2=AeET3BIiZ6TALI-KvZBWgHE_64MrLdLTTNjrgyst0tNM2GdBkenj9f-s3IzkGP1gD-s&_nc_ohc=G67lvFE8SMgQ7kNvgHeNGzU&_nc_oc=Adg_tl70nVoSjLbTATxA39df3koIJxzZxnok_-1NUPmMgE3m3Cb01FarSiy3UXi-pho&_nc_pt=1&_nc_zt=24&_nc_ht=scontent.felp1-1.fna&_nc_gid=Azmo9ypRjU0XEiRAB_n5IEp&oh=00_AYEkq9rVUYSOLk7oRIUFWL_PKvmQePfqPdeRr9GR7XxaDw&oe=67D99C05'),
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
