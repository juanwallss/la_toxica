import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

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
            print(message);
            textController.clear();
          }
        },
      ),
      onTapOutside: (event) {
        focusMode.unfocus();
      },
      onFieldSubmitted: (value) {
        textController.clear();
        focusMode.requestFocus();
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
