import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, this.onClick, super.key});
  final String text;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 40),
        padding: const EdgeInsets.symmetric(
          vertical:10,
          horizontal: 20
        ),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
