import 'package:flutter/material.dart';
import 'package:la_toxica/presentation/widgets/chat/message_bubble.dart';
import 'package:la_toxica/presentation/widgets/chat/message_field_box.dart';

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
              'https://img.freepik.com/foto-gratis/mujer-profesional-su-oficina_23-2147636008.jpg?t=st=1740808387~exp=1740811987~hmac=4bb4337b917fabe2a4aec23f37035412e78a5baf8ad8555e82119ba826c602c3&w=1060'),
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
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                      message: 'Hola',
                      isMyMessage: index.isEven,
                    );
                  })),
          const MessageFieldBox(),
        ],
      ),
    );
  }
}
