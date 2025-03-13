import 'package:flutter/material.dart';
import 'package:la_toxica/presentation/widgets/chat/image_bubble.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String? urlImageBubble;

  // Bool para verificar si el mensaje va del lado izquierdo o derecho
  final bool isMyMessage;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMyMessage,
    this.urlImageBubble,
  });

  @override
  Widget build(BuildContext context) {
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
            child: Text(message,style: const TextStyle(color: Colors.black),),
          ),
        ),
        const SizedBox(height: 6),
        
        if (urlImageBubble != null) ...[
          ImageBubble(urlImageBubble: urlImageBubble!),
          const SizedBox(
            height: 10,
          ),
        ]
      ],
    );
  }
}
