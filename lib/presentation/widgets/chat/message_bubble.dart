import 'package:flutter/material.dart';
import 'package:la_toxica/domain/entities/message.dart';
import 'package:la_toxica/presentation/widgets/chat/image_bubble.dart';

class MessageBubble extends StatelessWidget {
  final Message message;


  const MessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isMyMessage = message.fromWho == FromWho.me;
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment:
          isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMyMessage ? colors.primary : colors.tertiary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(message.text,style: const TextStyle(color: Colors.black),),
          ),
        ),
        const SizedBox(height: 6),
        
        if (message.imageUrl != null) ...[
          ImageBubble(urlImageBubble: message.imageUrl!),
          const SizedBox(
            height: 10,
          ),
        ]
      ],
    );
  }
}
