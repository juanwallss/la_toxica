import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  final void Function(String) onSend;
  const MessageFieldBox({super.key, required this.onSend});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final focusMode = FocusNode();
    final colors = Theme.of(context).colorScheme;
    return TextFormField(
      focusNode: focusMode,
      controller: textController,
      decoration: customInputDecoration(
        color: colors,
        onPressed: () {
          final message = textController.text;
          if (message.isNotEmpty) {
            textController.clear();
            widget.onSend(message);
            focusMode.requestFocus();
          }
        },
      ),
      onTapOutside: (event) {
        focusMode.unfocus();
      },
      onFieldSubmitted: (value) {
        textController.text += '\n';
        if (value.isNotEmpty) {
          widget.onSend(value);
          textController.clear();
          focusMode.requestFocus();
        }
      },
    );
  }

  InputDecoration customInputDecoration(
      {required VoidCallback onPressed, required ColorScheme color}) {
    return InputDecoration(
      hintText: 'Escribe un mensaje',
      hintStyle: TextStyle(color: color.secondary),
      enabledBorder: customOutlienInputBorder(color),
      focusedBorder: customOutlienInputBorder(color),
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: onPressed,
      ),
    );
  }

  OutlineInputBorder customOutlienInputBorder(ColorScheme colors) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: colors.primary),
    );
  }
}
